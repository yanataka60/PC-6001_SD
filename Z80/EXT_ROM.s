AZLCNV		EQU		0BEFH		;小文字->大文字変換
CONOUT		EQU		1075H		;CRTへの1バイト出力
MSGOUT		EQU		30CFH		;文字列の出力
LINPUT		EQU		28F9H		;スクリーン・エディタ
TBLOAD		EQU		0FAA7H		;LOADコマンドジャンプアドレス
TBSAVE		EQU		0FAA9H		;SAVEコマンドジャンプアドレス
TBLLIST		EQU		0FA91H		;LLISTコマンドジャンプアドレス
LBUF		EQU		0FBB9H
MONCLF		EQU		2739H		;CRコード及びLFコードの表示
KYSCAN		EQU		0FBCH		;リアルタイム・キーボード・スキャニング
MONBHX		EQU		397AH		;Aレジスタの内容を10進数として表示
DISPBL		EQU		1BCDH		;ベルコードの出力
FUNC8		EQU		0FB75H		;F8 KEY 定義領域
KEYIN		EQU		0FC4H		;1文字入力
STOPFLG		EQU		0FA18H		;STOP ESC KEY FLG
FNAME		EQU		0FECBH		;CMT FILE NAME
IOTimerCt	EQU		0F6H		; タイマカウントアップ値
MODEL		EQU		0FA33H		;機種格納WORK(PC-6001未使用領域)
DSPCLR		EQU		1DFBH		;画面消去

;PC-6001
PPI_A		EQU		07CH

PPI_B		EQU		PPI_A+1
PPI_C		EQU		PPI_A+2
PPI_R		EQU		PPI_A+3

;PC-6001
;8255 PORT アドレス 7CH～7FH
;07CH PORTA 送信データ(下位4ビット)
;07DH PORTB 受信データ(8ビット)
;07EH PORTC Bit

;7 IN  CHK
;6 IN
;5 IN
;4 IN 
;3 OUT
;2 OUT FLG
;1 OUT
;0 OUT
;
;7FH コントロールレジスタ

;DIRLISTコマンド		61H
;p6t LOAD コマンド	62H
;p6 LOAD コマンド	63H
;LOAD1BYTE コマンド	64H

;BASIC LOAD START	65H
;BASIC LOAD END		66H

;BASIC SAVE START	67H
;SAVE1BYTE			68H
;BASIC SAVE END		69H

        ORG		4000H

		DB		'A','B'			;拡張ROM認識コード

		DW		INIT			;POWER ONで8255を初期化、Luncher起動

		JP		LOADINI
		JP		LOAD1BYTE
		JP		SAVEINI
		JP		SAVE1BYTE
		JP		SAVEEND

;**** 8255初期化 ****
;PORTC下位BITをOUTPUT、上位BITをINPUT、PORTBをINPUT、PORTAをOUTPUT
INIT:
		LD		A,8AH
		OUT		(PPI_R),A
;出力BITをリセット
		XOR		A				;PORTA <- 0
		OUT		(PPI_A),A
		OUT		(PPI_C),A		;PORTC <- 0
		
		CALL	CMNCheckP60Mode	;機種判定
		LD		(MODEL),A

		LD		HL,TITLE_MSG
		CALL	MSGOUT
CMD1:	LD		A,'*'
		CALL	CONOUT
		CALL	LINPUT
		RET		C				;STOPでBASICに復帰
CMD2:
		INC		HL
		LD		A,(HL)
		CP		'*'				;入力時とスクリーンエディット時でIBUFに入る位置が変わるための対処、「*」ならポインタを進める
		JR		Z,CMD2
		CALL	AZLCNV			;大文字変換
		CP		'B'
		RET		Z				;BコマンドでもBASICに復帰
		CP		'1'
		JR		Z,BRET			;MODE1
		CP		'F'
		JP		Z,STLT			;Fコマンド
		CP		'L'
		JP		Z,MONLOAD		;Lコマンド

		LD		HL,MSG_CMD1
		CALL	MSGOUT			;コマンドエラー5行分出力
		LD		HL,MSG_CMD2
		CALL	MSGOUT
		LD		HL,MSG_CMD3
		CALL	MSGOUT
		LD		HL,MSG_CMD4
		CALL	MSGOUT
		LD		HL,MSG_CMD5
		CALL	MSGOUT
		LD		HL,MSG_CMD6
		CALL	MSGOUT
		JR		CMD1

BRET:	LD		A,(MODEL)
		AND		A
		JP		Z,DCLR

BRET2:	CALL	MONCLF
		LD		HL,PG_SEL			;PAGE選択表示
		CALL	MSGOUT
		CALL	KEYIN				;1文字入力(1-4)
		CALL	CONOUT
		CP		'1'
		JR		C,BRET2
		CP		'5'
		JR		NC,BRET2

		LD		HL,LBUF				;AUTOSTART文字列格納場所
		LD		(0FB8DH),HL
		LD		(HL),A				;PAGE書き込み
		CALL	MONCLF
		INC		HL
		LD		A,0DH
		LD		(HL),A
		INC		HL

		LD		A,15				;AUTOSTART文字列数
		LD		(0FA32H),A

		LD		B,13
		LD		DE,MODE12
BRET4:	LD		A,(DE)
		LD		(HL),A
		INC		HL
		INC		DE
		DJNZ	BRET4
		CALL	SDCHG1
		CALL	SDCHG3
		JP		DCLR
		
SDCHG1:	LD		A,55H				;0000H～3FFFHの書込み先を内部RAMに切り替え
		OUT		(0F2H),A
		LD		HL,0000H			;BASIC ROMを内部RAMにコピー
		LD		DE,0000H
		LD		BC,4000H
		LDIR
		RET

SDCHG3:	LD		A,0C3H				;その他SD対応パッチあて
		LD		(1A61H),A
		LD		HL,LOADINI
		LD		(1A62H),HL
		LD		A,0C3H
		LD		(1A70H),A
		LD		HL,LOAD1BYTE
		LD		(1A71H),HL
		LD		A,0C3H
		LD		(1AB8H),A
		LD		HL,SAVEINI
		LD		(1AB9H),HL
		LD		A,0C3H
		LD		(1ACCH),A
		LD		HL,SAVE1BYTE
		LD		(1ACDH),HL
		LD		A,0C3H
		LD		(1B06H),A
		LD		HL,SAVEEND
		LD		(1B07H),HL
		RET

TITLE_MSG:
		DB		'  ** PC-6001_SD Launcher **',0AH,0DH,00H

MODE12:
		DB		'OUT&HF0,&H7D',0DH	;0000H～3FFFH:内部RAM 4000～7FFFH:外部ROM

;**** 1BYTE受信 ****
;受信DATAをAレジスタにセットしてリターン
RCVBYTE:
		CALL	F1CHK             ;PORTC BIT7が1になるまでLOOP
		IN		A,(PPI_B)         ;PORTB -> A
		PUSH 	AF
		LD		A,05H
		OUT		(PPI_R),A         ;PORTC BIT2 <- 1
		CALL	F2CHK             ;PORTC BIT7が0になるまでLOOP
		LD		A,04H
		OUT		(PPI_R),A         ;PORTC BIT2 <- 0
		POP 	AF
		RET
		
;**** 1BYTE送信 ****
;Aレジスタの内容をPORTA下位4BITに4BITずつ送信
SNDBYTE:
		PUSH	AF
		RRA
		RRA
		RRA
		RRA
		AND		0FH
		CALL	SND4BIT
		POP		AF
		AND		0FH
		CALL	SND4BIT
		RET

;**** 4BIT送信 ****
;Aレジスタ下位4ビットを送信する
SND4BIT:
		OUT		(PPI_A),A
		LD		A,05H
		OUT		(PPI_R),A          ;PORTC BIT2 <- 1
		CALL	F1CHK             ;PORTC BIT7が1になるまでLOOP
		LD		A,04H
		OUT		(PPI_R),A          ;PORTC BIT2 <- 0
		CALL	F2CHK
		RET
		
;**** BUSYをCHECK(1) ****
; 82H BIT7が1になるまでLOP
F1CHK:	IN		A,(PPI_C)
		AND		80H               ;PORTC BIT7 = 1?
		JR		Z,F1CHK
		RET

;**** BUSYをCHECK(0) ****
; 82H BIT7が0になるまでLOOP
F2CHK:	IN		A,(PPI_C)
		AND		80H               ;PORTC BIT7 = 0?
		JR		NZ,F2CHK
		RET

CMNCheckP60Mode:
; タイマカウントで判別する
		LD		C,IOTimerCt
		IN		B,(C)				; タイマカウント値を取得する
		LD		DE,55AAH
		OUT		(C),D				; $55を出力する
		IN		A,(C)				; もう一度読みだして
		CP		D					; 比較する
		JR		NZ,.pc6001			; 違っていればタイマが無いので初代機
		OUT		(C),E				; $AAを出力する
		IN		A,(C)				; もう一度読みだして
		CP		E					; 比較する
		JR		NZ,.pc6001			; 違っていればタイマが無いので初代機
		OUT		(C),B				; タイマカウント値を元に戻す

; その他(PC-6001MK2、PC-6001MK2SR、PC-6601、PC-6601SR) で確定
		INC		A					; Acc = 1
		RET

; 無印 PC-6001 で確定
.pc6001:XOR		A					; Acc = 0
		RET

;************ Fコマンド DIRLIST **********************
STLT:
		DI
		INC		HL
		CALL	STFN              ;検索文字列を送信
		EX		DE,HL
		LD		HL,DEFDIR         ;行頭に'*L 'を付けることでカーソルを移動させリターンで実行できるように
		LD		BC,DEND-DEFDIR
		CALL	DIRLIST           ;DIRLIST本体をコール
		AND		A                 ;00以外ならERROR
		CALL	NZ,SDERR
;		EI
		JP		CMD1


;**** DIRLIST本体 (HL=行頭に付加する文字列の先頭アドレス BC=行頭に付加する文字列の長さ) ****
;****              戻り値 A=エラーコード ****
DIRLIST:
		LD		A,61H             ;DIRLISTコマンド61Hを送信
		CALL	STCD              ;コマンドコード送信
		AND		A                 ;00以外ならERROR
		JP		NZ,DLRET
		
		PUSH	BC
		LD		B,21H             ;ファイルネーム検索文字列33文字分を送信
STLT1:	LD		A,(DE)
		AND		A
		JR		NZ,STLT2
		XOR		A
STLT2:	CALL	AZLCNV            ;大文字に変換
		CP		22H               ;ダブルコーテーション読み飛ばし
		JR		NZ,STLT3
		INC		DE
		JR		STLT1
STLT3:	CALL	SNDBYTE           ;ファイルネーム検索文字列を送信
		INC		DE
		DEC		B
		JR		NZ,STLT1
		POP		BC

		CALL	RCVBYTE           ;状態取得(00H=OK)
		AND		A                 ;00以外ならERROR
		JP		NZ,DLRET

DL1:
		PUSH	HL
		PUSH	BC
		LD		DE,LBUF
		LDIR
		EX		DE,HL
DL2:	CALL	RCVBYTE           ;'00H'を受信するまでを一行とする
		AND		A
		JR		Z,DL3
		CP		0FFH              ;'0FFH'を受信したら終了
		JR		Z,DL4
		CP		0FEH              ;'0FEH'を受信したら一時停止して一文字入力待ち
		JR		Z,DL5
		LD		(HL),A
		INC		HL
		JR		DL2
DL3:	LD		(HL),00H
		LD		HL,LBUF           ;'00H'を受信したら一行分を表示して改行
DL31:	LD		A,(HL)
		AND		A
		JR		Z,DL33
		CALL	CONOUT
		INC		HL
		JR		DL31
DL33:	CALL	MONCLF
		POP		BC
		POP		HL
		JR		DL1
DL4:	CALL	RCVBYTE           ;状態取得(00H=OK)
		POP		BC
		POP		HL
		JR		DLRET

DL5:	PUSH	HL
		LD		HL,MSG_KEY1       ;HIT ANT KEY表示
		CALL	MSGOUT
		CALL	MONCLF
		POP		HL
DL6:	CALL	KYSCAN            ;1文字入力待ち
		JR		Z,DL6
		CALL	AZLCNV
		CP		1BH               ;ESCで打ち切り
		JR		Z,DL7
		CP		1EH               ;カーソル↑で打ち切り
		JR		Z,DL7
		CP		42H               ;「B」で前ページ
		JR		Z,DL8
		XOR		A                 ;それ以外で継続
		JR		DL8
DL7:	LD		A,0FFH            ;0FFH中断コードを送信
DL8:	CALL	SNDBYTE
		JP		DL2
		
DLRET:	RET
		
;************ Lコマンド p6t LOAD *************************
MONLOAD:
;		DI
		CALL	P6CHK
		CP		01H
		JP		Z,P6LOAD
		LD		A,62H				;p6t LOAD コマンド62Hを送信
		CALL	STCMD
		JP		NZ,CMD1
		

		CALL	RCVBYTE				;p6t情報読み出し正常ステータス受信
		AND		A
		JR		Z,ML0
		LD		HL,MSG_F7			;p6tファイルではない
		CALL	MSGOUT
		JP		CMD1

ML0:	CALL	RCVBYTE				;MODE受信
		AND		A
		JR		NZ,ML00
		LD		HL,MSG_F9			;MODE0は異常値
		CALL	MSGOUT
		JP		CMD1

ML00:	CP		05H
		JR		C,ML1
		LD		HL,MSG_F8			;MODE5以上は実行不可
		CALL	MSGOUT
		JP		CMD1
		
ML1:	LD		HL,LBUF				;AUTOSTART文字列格納場所
		LD		(0FB8DH),HL

		CALL	RCVBYTE				;PAGE受信
		ADD		A,30H
		LD		(HL),A				;PAGE書き込み
		INC		HL
		LD		A,0DH
		LD		(HL),A
		INC		HL
		
		LD		A,(MODEL)
		AND		A
		JR		Z,ML21
		LD		B,13
		LD		DE,MODE12
ML2:	LD		A,(DE)
		LD		(HL),A
		INC		HL
		INC		DE
		DJNZ	ML2
		
ML21:	CALL	RCVBYTE				;p6tファイル中のオートスタート文字列数受信
		LD		B,A

		LD		A,(MODEL)
		AND		A
		JR		Z,ML22
		LD		A,15				;AUTOSTART文字列数
		JR		ML23
ML22:	LD		A,2
ML23:	ADD		A,B
		LD		(0FA32H),A

		LD		A,B
		AND		A					;p6tファイル中のオートスタート文字列が無いならスキップ
		JR		Z,ML41
ML3:	CALL	RCVBYTE				;オートスタート文字列受信
		CP		0AH					;0AH->0DHに修正して書き込み
		JR		NZ,ML4
		LD		A,0DH
ML4:	LD		(HL),A
		INC		HL
		DJNZ	ML3

ML41:	LD		A,(MODEL)
		AND		A
		JR		Z,DCLR
		CALL	SDCHG1				;SD用パッチあてルーチンへ
		CALL	SDCHG3

DCLR:	CALL	DSPCLR
		RET
		
PG_SEL:
		DB		'How Many Pages?(1-4)',00H
AS_SEL:
		DB		'Auto Run?(y/n)',00H
MS_SAVE
		DB		'Saving ',00H
ATSTR:
		DB		'CLOAD',0DH,'RUN',0DH
ATSTR_END:
ATSTR2:
		DB		'CLOAD',0DH
ATSTR2_END:

;***** P6 LOAD *****************
P6LOAD:
		LD		A,63H				;p6 LOAD コマンド63Hを送信
		CALL	STCMD
		JP		NZ,CMD1
PL2:	CALL	MONCLF
		LD		HL,PG_SEL			;PAGE選択表示
		CALL	MSGOUT
		CALL	KEYIN				;1文字入力(1-4)
		CALL	CONOUT
		CP		'1'
		JR		C,PL2
		CP		'5'
		JR		NC,PL2

		LD		HL,LBUF				;AUTOSTART文字列格納場所
		LD		(0FB8DH),HL
		LD		(HL),A				;PAGE書き込み
		CALL	MONCLF
		INC		HL
		LD		A,0DH
		LD		(HL),A
		INC		HL

		PUSH	HL
		LD		HL,AS_SEL			;AUTO START選択表示
		CALL	MSGOUT
		CALL	KEYIN				;Y:AUTO START Y以外:選択したファイルをセットしてBASIC起動 
		CALL	AZLCNV
		POP		HL
		CALL	CONOUT
		CP		'Y'
		JR		Z,P67
		LD		A,8					;AUTOSTART文字列数
		JR		P68
P67:	LD		A,12				;AUTOSTART文字列数
P68:	LD		(0FA32H),A

		LD		A,(MODEL)
		AND		A
		JR		Z,P64

		LD		B,13
		LD		DE,MODE12
P63:	LD		A,(DE)
		LD		(HL),A
		INC		HL
		INC		DE
		DJNZ	P63

P64:	LD		A,(0FA32H)
		CP		8
		JR		Z,P66
		LD		B,ATSTR_END-ATSTR
		LD		DE,ATSTR
		JR		P65
P66:	LD		B,ATSTR2_END-ATSTR2
		LD		DE,ATSTR2
P65:	LD		A,(DE)
		LD		(HL),A
		INC		HL
		INC		DE
		DJNZ	P65
		LD		A,(MODEL)
		AND		A
		JP		Z,DCLR

		LD		A,(0FA32H)
		ADD		A,13
		LD		(0FA32H),A

		CALL	SDCHG1				;SD用パッチあてルーチンへ
		CALL	SDCHG3
		JP		DCLR
		
;********** LOAD ONE BYTE FROM SD *********
LOAD1BYTE:
		DI
		PUSH	BC
		PUSH	DE
		PUSH	HL
		LD		A,(STOPFLG)
		CP		00H
		JR		NZ,L1B1
		LD		A,64H			;LOAD1BYTE コマンド64Hを送信
		CALL	STCD
		CALL	RCVBYTE			;1Byteのみ受信
		LD		B,A
		XOR		A				;Z FLGをクリア
		LD		A,B
		POP		HL
		POP		DE
		POP		BC
		RET
L1B1:	POP		HL
		POP		DE
		POP		BC
		CALL	34CEH
;		EI
		JP		274DH

;****** FILE NAMEが取得できるまでスペース、ダブルコーテーションを読み飛ばし (IN:HL コマンド文字の次の文字 OUT:HL ファイルネームの先頭)*********
STFN:	PUSH	AF
STFN1:	LD		A,(HL)
		CP		20H
		JR		Z,STFN2
		CP		22H
		JR		NZ,STFN3
STFN2:	INC		HL               ;ファイルネームまでスペース読み飛ばし
		JR		STFN1
STFN3:	POP		AF
		RET

DEFDIR:
		DB		'*L '
DEND:

;**** コマンド送信 (IN:A コマンドコード)****
STCD:	CALL	SNDBYTE          ;Aレジスタのコマンドコードを送信
		CALL	RCVBYTE          ;状態取得(00H=OK)
		RET

;**** コマンド、ファイル名送信 (IN:A コマンドコード HL:ファイルネームの先頭)****
STCMD:	INC		HL
		CALL	STFN             ;空白除去
		PUSH	HL
		CALL	STCD             ;コマンドコード送信
		POP		HL
		AND		A                ;00以外ならERROR
		JP		NZ,SDERR
		CALL	STFS             ;ファイルネーム送信
		AND		A                ;00以外ならERROR
		JP		NZ,SDERR
		RET

;**** ファイルネーム送信(IN:HL ファイルネームの先頭) ******
STFS:	LD		B,20H
STFS1:	LD		A,(HL)           ;FNAME送信
		CP		22H
		JR		NZ,STFS2
		INC		HL
		JR		STFS1
STFS2:	CALL	SNDBYTE
		INC		HL
		DEC		B
		JR		NZ,STFS1
		LD		A,0DH
		CALL	SNDBYTE
		CALL	RCVBYTE          ;状態取得(00H=OK)
		RET

;**** .p6 or cas check ******
P6CHK:	PUSH	HL
		INC		HL
		CALL	STFN             ;空白除去
		LD		B,20H
P6CHK1:	LD		A,(HL)
		AND		A
		JR		Z,P6CHK2
		INC		HL
		DEC		B
		JR		NZ,P6CHK1
P6CHK2:	DEC		HL
		LD		A,(HL)
		CP		'6'
		JR		NZ,P6CHK5
		DEC		HL
		LD		A,(HL)
		CALL	AZLCNV
		CP		'P'
		JR		NZ,P6CHK3
		DEC		HL
		LD		A,(HL)
		CP		'.'
		JR		NZ,P6CHK3
		LD		A,01H
		JR		P6CHK4
P6CHK3:	XOR		A
P6CHK4:	POP		HL
		RET
		
P6CHK5:	CALL	AZLCNV
		CP		'S'
		JR		NZ,P6CHK3
		DEC		HL
		LD		A,(HL)
		CALL	AZLCNV
		CP		'A'
		JR		NZ,P6CHK3
		DEC		HL
		LD		A,(HL)
		CALL	AZLCNV
		CP		'C'
		JR		NZ,P6CHK3
		LD		A,01H
		JR		P6CHK4

;************** エラー内容表示 *****************************
SDERR:
		PUSH	AF
		CP		0F0H
		JR		NZ,ERR3
		LD		HL,MSG_F0        ;SD-CARD INITIALIZE ERROR
		JR		ERRMSG
ERR3:	CP		0F1H
		JR		NZ,ERR4
		LD		HL,MSG_F1        ;NOT FIND FILE
		JR		ERRMSG
ERR4:	CP		0F3H
		JR		NZ,ERR5
		LD		HL,MSG_F3        ;FILE EXIST
		JR		ERRMSG
ERR5:	CP		0F6H
		JR		NZ,ERR99
		LD		HL,MSG_FNAME     ;PARAMETER FAILED
		JR		ERRMSG
ERR99:	CALL	MONBHX
		LD		HL,MSG99         ;その他ERROR
ERRMSG:	CALL	MSGOUT
		CALL	MONCLF
		CALL	DISPBL
		LD		A,03H
		LD		(STOPFLG),A
		POP		AF
		RET

MSG_CMD1:
		DB		'COMMAND FAILED!',0DH,0AH,00H
MSG_CMD2:
		DB		' STOP: Return Basic(Not Use SD)',0DH,0AH,00H
MSG_CMD3:
		DB		' B   : Return Basic(Not Use SD)',0DH,0AH,00H
MSG_CMD4:
		DB		' 1   : N60 BASIC(SD)',0DH,0AH,00H
MSG_CMD5:
		DB		' F x : Find SD File',0DH,0AH,00H
MSG_CMD6:
		DB		' L x : Load From SD',0DH,0AH,00H

MSG_F0:
		DB		'SD-CARD INITIALIZE ERROR'
		DB		00H
		
MSG_F1:
		DB		'NOT FIND FILE'
		DB		00H
		
MSG_F2:
		DB		'NOT OBJECT FILE'
		DB		00H
		
MSG_F3:
		DB		'FILE EXIST'
		DB		00H
		
MSG_F5:
		DB		'NO PROGRAM!!'
		DB		00H
		
MSG_F6:
		DB		'NOT BASIC PROGRAM'
		DB		0DH,0AH,00H

MSG_F7:
		DB		'NOT P6T FILE?'
		DB		0DH,0AH,00H
		
MSG_F8:
		DB		'MODE5 MODE6 NOT EXECUTE'
		DB		0DH,0AH,00H
		
MSG_F9:
		DB		'MODE0 NOT EXECUTE'
		DB		0DH,0AH,00H
		
MSG99:
		DB		' ERROR'
		DB		00H
		

MSG_KEY1:
		DB		'NEXT:ANY BACK:B BREAK:UP OR ESC'
		DB		00H

MSG_FNAME:
		DB		'PARAMETAR FAILED!'
		DB		00H
		

SAVEINI:
		DI
		LD		HL,MS_SAVE
		CALL	MSGOUT
		CALL	MONCLF
		XOR		A
		LD		(FNAME+6),A
		LD		HL,FNAME-1
		LD		A,67H            ;コマンド67Hを送信
		CALL	STCMD
		JR		NZ,SINI1
		XOR		A
		JR		SINI2
SINI1:	LD		A,03H
SINI2:	LD		(STOPFLG),A
;		EI
		RET

SAVE1BYTE:
		DI
		PUSH	BC
		PUSH	DE
		PUSH	HL
		PUSH	AF
		LD		A,68H			;SAVE1BYTE コマンド68Hを送信
		CALL	STCD
		POP		AF
		CALL	SNDBYTE			;1Byteのみ受信
		POP		HL
		POP		DE
		POP		BC
;		EI
		RET

SAVEEND:
		LD		A,69H
		CALL	STCD
		RET

LOADINI:
		DI
		XOR		A
		LD		(FNAME+6),A
		LD		HL,FNAME
		LD		A,(HL)
		AND		A
		RET		Z
		DEC		HL
		LD		A,63H            ;コマンド63Hを送信
		CALL	STCMD
		JR		NZ,LINI1
		XOR		A
		JR		LINI2
LINI1:	LD		A,03H
LINI2:	LD		(STOPFLG),A
		XOR		A
		LD		(FNAME),A
;		EI
		RET

		END
