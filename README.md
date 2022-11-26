# PC-6001にSD-CARDからロード、セーブ機能

![TITLE](https://github.com/yanataka60/PC-6001_SD/blob/main/JPEG/TITLE.jpg)

　PC-6001でSD-CARDからロード、セーブ機能を実現するものです。

　対応機種は初代PC-6001です。

　PC-6001mk2以降の機種でも動作しますが、MODE1、MODE2のみの動作となります。また、PC-6601、PC-6601SRはドライブ数切替スイッチは0として使ってください。なお、PC-6001mk2以降の機種では裏RAMにBASIC-ROMをコピーしてパッチを当てますのでBASIC-ROMを差し替える必要はありません。

　対応しているCMT形式は、P6T形式とCAS形式(拡張子はP6、CASのどちらでも大丈夫)です。

　CMTからの読み込み実行に数分掛かっていたゲームも数十秒で実行できます。

　なお、Arduino、ROMへ書き込むための機器が別途必要となります。

![PC-6001_SD](https://github.com/yanataka60/PC-6001_SD/blob/main/JPEG/PC-6001_SD(2).JPG)

## 対応できないもの
　BASIC-ROMのCMT関連ルーチンにパッチを当てたROMに差し替えることでSD-CARDへのアクセスを実現していますのでBASIC-ROMのCMT関連ルーチンをコールせず独自にCMTからLOADするソフト（ロードランナー等）は対応できないので途中で止まります。

## 回路図
### PC-6001_SD基板
　KiCadフォルダ/PC-6001_SD内のPC-6001_SD.pdfを参照してください。

[回路図](https://github.com/yanataka60/PC-6001_SD/blob/main/Kicad/PC-6001_SD/PC-6001_SD.pdf)

![PC-6001_SD](https://github.com/yanataka60/PC-6001_SD/blob/main/Kicad/PC-6001_SD/PC-6001_SD.jpg)

### BASIC-ROM挿し替え用基板
　KiCadフォルダ/ROM_SOCKET内のROM_SOCKET.pdfを参照してください。

[回路図](https://github.com/yanataka60/PC-6001_SD/blob/main/Kicad/ROM_SOCKET/ROM_SOCKET.pdf)

![PC-6001_SD](https://github.com/yanataka60/PC-6001_SD/blob/main/Kicad/ROM_SOCKET/ROM_SOCKET.jpg)

## 部品
### PC-6001_SD基板
|番号|品名|数量|備考|
| ------------ | ------------ | ------------ | ------------ |
||J2、J3のいずれか(注1)|||
|J2|Micro_SD_Card_Kit|1|秋月電子通商 AE-microSD-LLCNV (注2)|
|J3|MicroSD Card Adapter|1|Arduino等に使われる5V電源に対応したもの (注4)|
|U1|74LS04|1||
|U2|74LS30|1||
|U3|74LS32|1||
|U4|8255|1||
|U5|2764/28C64相当品|1||
|U6|SRAM 62256相当品|1||
|U7|Arduino_Pro_Mini_5V|1|(注3)|
|C1 C2 C3 C4 C5 C6|積層セラミックコンデンサ 0.1uF|6||
|C7|電解コンデンサ 16v100uF|1||

　　　注1)J2又はJ3のどちらかを選択して取り付けてください。

　　　注2)秋月電子通商　AE-microSD-LLCNVのJ1ジャンパはショートしてください。

　　　注3)Arduino Pro MiniはA4、A5ピンも使っています。

　　　注4)MicroSD Card Adapterを使う場合

　　　　　J3に取り付けます。

　　　　　MicroSD Card Adapterについているピンヘッダを除去してハンダ付けするのが一番確実ですが、J3の穴にMicroSD Card Adapterをぴったりと押しつけ、裏から多めにハンダを流し込むことでハンダ付けをする方法もあります。なお、この方法の時にはしっかりハンダ付けが出来たかテスターで導通を確認しておいた方が安心です。

ハンダ付けに自信のない方はJ2の秋月電子通商　AE-microSD-LLCNVをお使いください。AE-microSD-LLCNVならパワーLED、アクセスLEDが付いています。

![MicroSD Card Adapter1](https://github.com/yanataka60/PC-6001_SD/blob/main/JPEG/MicroSD%20Card%20Adapter.JPG)

![MicroSD Card Adapter2](https://github.com/yanataka60/PC-6001_SD/blob/main/JPEG/MicroSD%20Card%20Adapter2.JPG)

![MicroSD Card Adapter3](https://github.com/yanataka60/PC-6001_SD/blob/main/JPEG/MicroSD%20Card%20Adapter3.JPG)

## ROMへの書込み
　Z80フォルダ内のEXT_ROM.binをROMライター(TL866II Plus等)を使って2764又は28C64に書き込みます。

## Arduinoプログラム
　Arduino IDEを使ってArduinoフォルダのPC-6001mk2_SDフォルダ内PC-6001mk2_SD.inoを書き込みます。

　SdFatライブラリを使用しているのでArduino IDEメニューのライブラリの管理からライブラリマネージャを立ち上げて「SdFat」をインストールしてください。

　「SdFat」で検索すれば見つかります。「SdFat」と「SdFat - Adafruit Fork」が見つかりますが「SdFat」のほうを使っています。

注)Arduinoを基板に直付けしている場合、Arduinoプログラムを書き込むときは、カートリッジスロットから抜き、74LS04を外したうえで書き込んでください。

## BASIC-ROMの挿し替え
　まず、基板を完成させ、拡張スロットに挿入して電源を入れます。

　画面に「PC-6001_SD Launcher」と表示されるので、STOPキー又は「1」コマンド、「B」コマンドでBASICを起動します。

　入力待ちになったら「EXEC &H4012[CR]」と入力するとBASIC-ROMの内容をSD-CARDに保存するプログラムが実行されます。

　終わったらSD-CARDを抜き、Windowsパソコン等で内容を確認すると「ROM60A.CAS」と「ROM60B.CAS」という二つのファイルが作成されているはずです。

　「ROM60A.CAS」「ROM60B.CAS」ともバイナリのダンプファイルですので拡張子を「.bin」に変更しておいてください。

　「ROM60A.bin」は0000h～3FFFhまでのBASIC-ROM全体になります。EMULATOR等に使ってください。

　「ROM60B.bin」は0000h～1FFFhまでのBASIC-ROM前半でこちらにパッチを当て挿し替えることになります。

### BASIC-ROMへのパッチあて
　以下のアドレスを修正します。

|ADDRESS|修正前|修正後|
| ------------ | ------------ | ------------ |
|1A61|C5 D5 E5|C3 12 58|
|1A70|C5 D5 E5|C3 15 58|
|1AB8|C5 D5 E5|C3 18 58|
|1ACC|C5 D5 E5|C3 1B 58|
|1B06|C5 D5 E5|C3 1E 58|
　出来上がったバイナリを27256等に焼いて本体内ICソケットに差し替えても良いのですが、できれば27512等にオリジナルバイナリを前半、パッチ済みバイナリを後半において焼き、スイッチで切り替えられるようにすると便利です。

## 接続
　カートリッジスロットに挿入します。

![cartridge](https://github.com/yanataka60/PC-6001mk2_SD/blob/main/JPEG/cartridge.jpg)

　カートリッジスロットへの抜き差しに基板のみでは不便です。

　STLフォルダに基板を載せられるトレイの3Dデータを置いたので出力して使うと便利です。

![Tray](https://github.com/yanataka60/PC-6001mk2_SD/blob/main/JPEG/TRAY.JPG)

　PC-6601、PC-6601SRはドライブ数切替スイッチは0として使ってください。

![Drive](https://github.com/yanataka60/PC-6001mk2_SD/blob/main/JPEG/DRIVE.JPG)

## SD-CARD
　FAT16又はFAT32が認識できます。

　ルートに置かれた拡張子が「.P6T」又は「.CAS」の形式ファイルのみ認識できます。(以外のファイル、フォルダも表示されますがLOAD実行の対象になりません)

　ファイル名は拡張子を除いて32文字まで、ただし半角カタカナ、及び一部の記号はArduinoが認識しないので使えません。パソコンでファイル名を付けるときはアルファベット、数字および空白でファイル名をつけてください。

　起動直後の画面は横32文字表示です。拡張子を含めて27文字以下にしたほうが画面が乱れません。

## MODE選択
### 初代PC-6001
　MODE1、MODE2の切り替えは、PC-6001_SD基板上のRAM切替スイッチにより選択します。16K側でMODE1、32K側でMODE2です。

### PC-6001mk2以降
　PC-6001_SD基板上のRAM切替スイッチは16K側にしてください。

　通常に電源ON、またはRESETしたときにはMODE1となります。

　MODE2にしたい時は、数字の2キーを押したまま、電源ON、またはRESETしてください。

## 使い方
起動直後は拡張ROMのプログラムが走り、以下のコマンドが使えます。

### Launcherコマンド
#### 1[CR]
次に「How Many Pages?(1-4)」と聞いてくるので画面数を入力すると入力された数字のMODEと画面数でSD対応にして起動します。

#### B[CR]
SD対応せずにBASICを起動します。

[STOP]キーと動作は同じです。

#### [STOP]キー
SD対応せずにBASICを起動します。

B[CR]と動作は同じです。

#### F[CR]又はF 文字列[CR]
文字列を入力せずにF[CR]のみ入力するとSD-CARDルートディレクトリにあるファイルの一覧を表示します。

文字列を付けて入力すればSD-CARDルートディレクトリにあるその文字列から始まるファイルの一覧を表示します。

10件表示したところで指示待ちになるので打ち切るならESC又は↑を入力すると打ち切られ、Bキーで前の10件に戻ります。それ以外のキーで次の10件を表示します。

　行頭に「*L 」を付加して表示してあるので実行したいファイルにカーソルキーを合わせて[CR]キーを押すだけでLOAD可能です。

　LOADの挙動については次のLコマンドの記述を参照してください。

　表示される順番は、登録順となりファイル名アルファベッド順などのソートした順で表示することはできません。

##### 例)
　　F[CR]

　　F S[CR]

　　F SP[CR]

#### L DOSファイル名[CR]
指定したDOSフィル名のファイルをSD-CARDからLOADします。

ファイル名の最後の「.P6T」「.CAS」は有っても無くても構いませんが、無い場合は「.P6T」が指定されたものとみなします。

　例)

　　L TEST.P6T -> DOSファイル名「TEST.P6T」を読み込みます。

　　L TEST.CAS -> DOSファイル名「TEST.CAS」を読み込みます。

　　L TEST -> DOSファイル名「TEST.P6T」を読み込みます。

　選択したファイルが「P6T」形式の場合、設定されたPagesで起動したうえで自動実行文字列を実行します。

　選択したファイルが「CAS」形式の場合、「How Many Pages?(1-4)」と聞いてくるので画面数Eを入力、次に「Auto Run?(y/n)」と聞いてくるので「y」とすれば起動直後にCLOAD[CR]RUN[CR]が実行され、「n」とすればCLOAD[CR]だけが実行されます。

#### 操作上の注意
　「SD-CARD INITIALIZE ERROR」と表示されたときは、SD-CARDが挿入されているか確認し、PC-6001本体をリセットしてください。Arduinoのみのリセットでは復旧しません。

　SD-CARDにアクセスしていない時に電源が入ったままで SD-CARDを抜いた後、再挿入しSD-CARDにアクセスすると「SD-CARD INITIALIZE ERROR」となる場合があります。再挿入した場合にはSD-CARDにアクセスする前にArduinoを必ずリセットしてください。

　SD-CARDの抜き差しは電源を切った状態で行うほうがより確実です。

### BASICコマンド
#### LOAD "DOSファイル名"[CR]
指定したDOSフィル名のBASICプログラムをSD-CARDからLOADします。

ファイル名は6文字以内で必須です。6文字以上入力された場合には7文字以降は無視されます。ファイル名を入力せずにCLOAD[CR]とすると暴走します。

ファイル名の前に"(ダブルコーテーション)は必須ですが、ファイル名の後ろに"(ダブルコーテーション)は有っても無くても構いません。

ファイル名の最後に「.CAS」は必要ありません。「.CAS」が指定されたものとみなします。

　例)

　　LOAD "TEST" -> DOSファイル名「TEST.CAS」を読み込みます。

　　LOAD "TESTTEST" -> DOSファイル名「TESTTE.CAS」を読み込みます。

　　LOAD "TEST.BAS.CMT" -> DOSファイル名「TEST.BA.CMT」を読み込みます。

#### SAVE "DOSファイル名"[CR]
BASICプログラムを指定したDOSフィル名でSD-CARDに上書きSAVEします。

ファイル名は6文字以内で必須です。6文字以上入力された場合には7文字以降は無視されます。

ファイル名の前に"(ダブルコーテーション)は必須ですが、ファイル名の後ろに"(ダブルコーテーション)は有っても無くても構いません。

ファイル名の最後の「.CAS」は必要ありません。「.CAS」が指定されたものとみなします。

　例)

　　SAVE "TEST" -> 「TEST.CAS」で保存される。

　　SAVE "TESTTEST" -> 「TESTTE.CAS」で保存される。

## 謝辞
　基板の作成に当たり以下のデータを使わせていただきました。ありがとうございました。

　Arduino Pro Mini

　　https://github.com/g200kg/kicad-lib-arduino

　AE-microSD-LLCNV

　　https://github.com/kuninet/PC-8001-SD-8kRAM
