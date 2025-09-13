CHKST		EQU		08400H
CHKEND		EQU		0F700H

CONOUT		EQU		1075H			;CRTへの1バイト出力
MONCLF		EQU		2739H			;CRコード及びLFコードの表示
MSGOUT		EQU		30CFH			;文字列の出力

			ORG		0F800H

;******** 事前にRAMに書き込み *********************
			LD		HL,CHKST	;書込開始アドレス
			LD		DE,CHKEND	;書込終了アドレス+1

LOP0:		LD		A,L
			LD		(HL),A		;RAM書込
			INC		HL			;書込開始アドレス+1
			PUSH	HL
			AND		A
			SBC		HL,DE		;書込開始アドレスが書込終了アドレス以下ならループ
			POP		HL
			JR		NZ,LOP0

;******** RAM CHECK START **************
			LD		HL,CHKST	;CHECK開始アドレス
			LD		DE,CHKEND	;CHECK終了アドレス+1
			
LOP1:		CALL	MONCLF		;改行
			CALL	PR4HEX		;CHECKアドレス表示
			CALL	MONSPC		;空白

			LD		A,L
			CALL	PR2HEX		;書込んだはずのDATAを表示
			LD		A,(HL)		;RAM読込
			CALL	PR2HEX		;RAMから読み出したDATAを表示
			CP		L	  		;読込DATA比較
			JR		NZ,ERR		;一致しなければERR
			
			CALL	MONSPC		;空白

			LD		A,55H		;書込DATA
			CALL	PR2HEX		;書込DATA表示
			LD		(HL),A		;CHECK DATA 書込
			LD		A,(HL)		;CHECK DATA 読込
			CALL	PR2HEX		;読込DATA表示
			CP		55H			;読込DATA比較
			JR		NZ,ERR		;一致しなければERR
			
			CALL	MONSPC		;空白

			LD		A,0AAH		;書込DATA
			CALL	PR2HEX		;書込DATA表示
			LD		(HL),A		;CHECK DATA 書込
			LD		A,(HL)		;CHECK DATA 読込
			CALL	PR2HEX		;読込DATA表示
			CP		0AAH  		;読込DATA比較
			JR		NZ,ERR		;一致しなければERR
			
			INC		HL			;CHECK開始アドレス+1
			PUSH	HL
			AND		A
			SBC		HL,DE		;CHECK開始アドレスがCHECK終了アドレス以下ならループ
			POP		HL
			JR		NZ,LOP1
			LD		HL,MSG_OK
			JR		MSG

ERR:		LD		HL,MSG_ERR
MSG:		CALL	MSGOUT
			HALT

MSG_OK:		DB		'RAM OK!',0DH,0AH,00H

MSG_ERR:	DB		'RAM ERROR!',0DH,0AH,00H

MONSPC:
			LD		A,20H
			CALL	CONOUT
			RET

PR4HEX:		PUSH	HL
			PUSH	AF
			LD		A,H
			CALL	PR2HEX
			LD		A,L
			CALL	PR2HEX
			POP		AF
			POP		HL
			RET

PR2HEX:		PUSH	HL			;Aレジスタの内容を16進数2桁で表示
			PUSH	AF
			PUSH	AF
			AND		0F0H
			SRL		A
			SRL		A
			SRL		A
			SRL		A
			CALL	HEX2ASC
			CALL	CONOUT
			POP		AF
			AND		0FH
			CALL	HEX2ASC
			CALL	CONOUT
			POP		AF
			POP		HL
			RET

HEX2ASC:	CP		0AH
			JR		NC,HA2
			ADD		A,30H
			RET
HA2:		ADD		A,37H
			RET

			END
