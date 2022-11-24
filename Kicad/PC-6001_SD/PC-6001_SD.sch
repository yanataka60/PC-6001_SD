EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 17000 14961
encoding utf-8
Sheet 1 1
Title "PC-6001_SD"
Date "2022-01-14"
Rev "Rev1.3"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6500 4500 6500 1900
Wire Wire Line
	6500 1900 7000 1900
Wire Wire Line
	6400 2000 7000 2000
Wire Wire Line
	3850 2700 7000 2700
Wire Wire Line
	3850 2800 7000 2800
Wire Wire Line
	3850 2900 7000 2900
Wire Wire Line
	3850 3000 7000 3000
$Comp
L power:+5V #PWR05
U 1 1 61C53293
P 7400 1700
F 0 "#PWR05" H 7400 1550 50  0001 C CNN
F 1 "+5V" H 7415 1873 50  0000 C CNN
F 2 "" H 7400 1700 50  0001 C CNN
F 3 "" H 7400 1700 50  0001 C CNN
	1    7400 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61CA5FA4
P 7400 3900
F 0 "#PWR06" H 7400 3650 50  0001 C CNN
F 1 "GND" H 7405 3727 50  0000 C CNN
F 2 "" H 7400 3900 50  0001 C CNN
F 3 "" H 7400 3900 50  0001 C CNN
	1    7400 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 61E99EF6
P 7050 3900
F 0 "C5" V 6900 4000 50  0000 C CNN
F 1 "0.1uF" V 6900 3750 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7088 3750 50  0001 C CNN
F 3 "~" H 7050 3900 50  0001 C CNN
	1    7050 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 3900 7400 3900
Wire Wire Line
	7400 3800 7400 3900
Wire Wire Line
	6900 3900 6900 3400
Wire Wire Line
	6900 1700 7400 1700
Wire Wire Line
	7000 3300 6900 3300
Connection ~ 6900 3300
Wire Wire Line
	6900 3300 6900 1700
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 626B92AA
P 2650 8050
F 0 "#FLG0101" H 2650 8125 50  0001 C CNN
F 1 "PWR_FLAG" H 2650 8223 50  0000 C CNN
F 2 "" H 2650 8050 50  0001 C CNN
F 3 "~" H 2650 8050 50  0001 C CNN
	1    2650 8050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR015
U 1 1 62901E30
P 2950 7950
F 0 "#PWR015" H 2950 7800 50  0001 C CNN
F 1 "+5V" H 2965 8123 50  0000 C CNN
F 2 "" H 2950 7950 50  0001 C CNN
F 3 "" H 2950 7950 50  0001 C CNN
	1    2950 7950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 7950 2950 8050
Wire Wire Line
	2650 8050 2950 8050
Connection ~ 2950 8050
Wire Wire Line
	7000 3100 3850 3100
$Comp
L Device:CP1 C7
U 1 1 61AFFCD6
P 2950 8200
F 0 "C7" H 3065 8246 50  0000 L CNN
F 1 "100uF" H 3065 8155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2950 8200 50  0001 C CNN
F 3 "~" H 2950 8200 50  0001 C CNN
	1    2950 8200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 61B04D1B
P 2950 8500
F 0 "#PWR013" H 2950 8250 50  0001 C CNN
F 1 "GND" H 2955 8327 50  0000 C CNN
F 2 "" H 2950 8500 50  0001 C CNN
F 3 "" H 2950 8500 50  0001 C CNN
	1    2950 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3400 6900 3400
Connection ~ 6900 3400
Wire Wire Line
	6900 3400 6900 3300
Wire Wire Line
	7900 5600 7900 2600
Wire Wire Line
	8750 2600 7900 2600
Connection ~ 7900 2600
Wire Wire Line
	7800 2600 7900 2600
Wire Wire Line
	6600 3600 6600 6900
Connection ~ 6600 6900
$Comp
L 74xx:74LS30 U2
U 1 1 621DA5E3
P 7250 6050
F 0 "U2" H 7250 6575 50  0000 C CNN
F 1 "74LS30" H 7250 6484 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7250 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 7250 6050 50  0001 C CNN
	1    7250 6050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS30 U2
U 2 1 621FB49F
P 8950 8200
F 0 "U2" H 9180 8246 50  0000 L CNN
F 1 "74LS30" H 9180 8155 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8950 8200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS30" H 8950 8200 50  0001 C CNN
	2    8950 8200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 7 1 62200B27
P 7850 8200
F 0 "U1" H 8080 8246 50  0000 L CNN
F 1 "74LS04" H 8080 8155 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7850 8200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7850 8200 50  0001 C CNN
	7    7850 8200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 6 1 6232F73D
P 9300 3700
F 0 "U1" H 9500 3450 50  0000 C CNN
F 1 "74LS04" H 9150 3450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9300 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9300 3700 50  0001 C CNN
	6    9300 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6550 6750 6550
Wire Wire Line
	6750 6550 6750 6350
Wire Wire Line
	6750 6350 6950 6350
Wire Wire Line
	7550 6050 7650 6050
Wire Wire Line
	7650 4000 7650 6050
$Comp
L power:+5V #PWR017
U 1 1 6252FE80
P 7300 6550
F 0 "#PWR017" H 7300 6400 50  0001 C CNN
F 1 "+5V" H 7315 6723 50  0000 C CNN
F 2 "" H 7300 6550 50  0001 C CNN
F 3 "" H 7300 6550 50  0001 C CNN
	1    7300 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 6450 6900 6450
Wire Wire Line
	6900 6450 6900 6650
Wire Wire Line
	6900 6650 7300 6650
Wire Wire Line
	7300 6650 7300 6550
$Comp
L Device:C C1
U 1 1 628C00D7
P 7400 8250
F 0 "C1" V 7250 8350 50  0000 C CNN
F 1 "0.1uF" V 7250 8100 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7438 8100 50  0001 C CNN
F 3 "~" H 7400 8250 50  0001 C CNN
	1    7400 8250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 628E1651
P 8500 8250
F 0 "C2" V 8350 8350 50  0000 C CNN
F 1 "0.1uF" V 8350 8100 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 8538 8100 50  0001 C CNN
F 3 "~" H 8500 8250 50  0001 C CNN
	1    8500 8250
	-1   0    0    1   
$EndComp
Wire Wire Line
	7400 8100 7400 7600
Wire Wire Line
	8950 7600 8950 7700
Wire Wire Line
	7400 8400 7400 8800
Wire Wire Line
	7400 8800 7850 8800
Wire Wire Line
	7850 8800 7850 8700
Wire Wire Line
	7850 8800 8500 8800
Wire Wire Line
	8950 8800 8950 8700
Connection ~ 7850 8800
Wire Wire Line
	8500 8400 8500 8800
Connection ~ 8500 8800
Wire Wire Line
	8500 8800 8950 8800
$Comp
L power:GND #PWR016
U 1 1 62BBAEEE
P 7400 8900
F 0 "#PWR016" H 7400 8650 50  0001 C CNN
F 1 "GND" H 7405 8727 50  0000 C CNN
F 2 "" H 7400 8900 50  0001 C CNN
F 3 "" H 7400 8900 50  0001 C CNN
	1    7400 8900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 62C0DD1E
P 7400 7500
F 0 "#PWR014" H 7400 7350 50  0001 C CNN
F 1 "+5V" H 7415 7673 50  0000 C CNN
F 2 "" H 7400 7500 50  0001 C CNN
F 3 "" H 7400 7500 50  0001 C CNN
	1    7400 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 7500 7400 7600
Connection ~ 7400 7600
Wire Wire Line
	7400 8800 7400 8900
Connection ~ 7400 8800
Wire Wire Line
	6400 2000 6400 4600
Text Label 2250 2900 0    50   ~ 0
~RAS2
Text Label 2250 3000 0    50   ~ 0
~DRD2
Text Label 2250 3100 0    50   ~ 0
~WE
Text Label 2250 3200 0    50   ~ 0
~WAIT
Text Label 2250 3300 0    50   ~ 0
~M1
Text Label 2250 3400 0    50   ~ 0
~IORQ
Text Label 2250 3500 0    50   ~ 0
~WR
Text Label 2250 3600 0    50   ~ 0
~RESET
Text Label 2250 3700 0    50   ~ 0
A9
Text Label 2250 3800 0    50   ~ 0
A11
Text Label 2250 3900 0    50   ~ 0
A7
Text Label 2250 4000 0    50   ~ 0
A12
Text Label 2250 4100 0    50   ~ 0
A14
Text Label 2250 4200 0    50   ~ 0
A1
Text Label 2250 4300 0    50   ~ 0
A3
Text Label 2250 4400 0    50   ~ 0
A5
Text Label 2250 4500 0    50   ~ 0
D1
Text Label 2250 4600 0    50   ~ 0
D3
Text Label 2250 4700 0    50   ~ 0
D5
Text Label 2250 4800 0    50   ~ 0
D7
Text Label 2250 4900 0    50   ~ 0
GND
Text Label 2950 3400 0    50   ~ 0
~MREQ
Text Label 2950 3800 0    50   ~ 0
A10
Text Label 2950 3900 0    50   ~ 0
A6
Text Label 2950 4000 0    50   ~ 0
A8
Text Label 2950 4100 0    50   ~ 0
A13
Text Label 2950 4200 0    50   ~ 0
A0
Text Label 2950 4300 0    50   ~ 0
A2
Text Label 2950 4400 0    50   ~ 0
A4
Text Label 2950 4500 0    50   ~ 0
D0
Text Label 2950 4600 0    50   ~ 0
D2
Text Label 2950 5200 0    50   ~ 0
+12V
Text Label 2950 5300 0    50   ~ 0
-12V
Wire Wire Line
	2250 3700 2450 3700
Wire Wire Line
	2250 3600 2450 3600
Wire Wire Line
	2250 3500 2450 3500
Wire Wire Line
	2250 3400 2450 3400
Wire Wire Line
	2250 3300 2450 3300
Wire Wire Line
	2250 3200 2450 3200
Wire Wire Line
	2250 3100 2450 3100
Wire Wire Line
	2250 3000 2450 3000
Connection ~ 6500 1900
Connection ~ 6400 2000
Wire Wire Line
	2250 4000 2450 4000
Wire Wire Line
	2250 4100 2450 4100
Wire Wire Line
	2250 4200 2450 4200
Wire Wire Line
	2250 4300 2450 4300
Wire Wire Line
	2250 4400 2450 4400
Wire Wire Line
	2250 4500 2450 4500
Wire Wire Line
	2950 4200 3100 4200
Wire Wire Line
	5450 6900 6600 6900
Wire Wire Line
	2250 4600 2450 4600
Wire Wire Line
	2250 4700 2450 4700
Wire Wire Line
	2950 4600 3100 4600
Wire Wire Line
	2250 4900 2450 4900
Wire Wire Line
	2250 4800 2450 4800
Wire Wire Line
	3850 2100 4100 2100
Wire Wire Line
	3850 2200 4200 2200
Wire Wire Line
	3850 2300 4300 2300
Wire Wire Line
	3850 2400 4400 2400
Wire Wire Line
	3850 2500 4500 2500
Wire Wire Line
	3850 2600 4600 2600
Wire Wire Line
	6950 6250 4100 6250
Wire Wire Line
	4100 6250 4100 2100
Connection ~ 4100 2100
Wire Wire Line
	4100 2100 7000 2100
Wire Wire Line
	6950 6150 4200 6150
Wire Wire Line
	4200 6150 4200 2200
Connection ~ 4200 2200
Wire Wire Line
	4200 2200 7000 2200
Wire Wire Line
	6950 6050 4300 6050
Wire Wire Line
	4300 6050 4300 2300
Connection ~ 4300 2300
Wire Wire Line
	4300 2300 7000 2300
Wire Wire Line
	6950 5950 4400 5950
Wire Wire Line
	4400 5950 4400 2400
Connection ~ 4400 2400
Wire Wire Line
	4400 2400 7000 2400
Wire Wire Line
	6950 5850 4500 5850
Wire Wire Line
	4500 5850 4500 2500
Connection ~ 4500 2500
Wire Wire Line
	4500 2500 7000 2500
Wire Wire Line
	4600 5650 4600 2600
Connection ~ 4600 2600
Wire Wire Line
	4600 2600 7000 2600
$Comp
L 74xx:74LS04 U1
U 4 1 63D902FA
P 6200 6550
F 0 "U1" H 6200 6867 50  0000 C CNN
F 1 "74LS04" H 6200 6776 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6200 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6200 6550 50  0001 C CNN
	4    6200 6550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 5 1 63D917E4
P 6200 5650
F 0 "U1" H 6200 5967 50  0000 C CNN
F 1 "74LS04" H 6200 5876 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6200 5650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6200 5650 50  0001 C CNN
	5    6200 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4500 3100 4500
Wire Wire Line
	2950 4300 3100 4300
Wire Wire Line
	2950 4400 3100 4400
Wire Wire Line
	2950 3800 3100 3800
Wire Wire Line
	2950 3900 3100 3900
Wire Wire Line
	2950 4000 3100 4000
Wire Wire Line
	2950 4100 3100 4100
Wire Wire Line
	5250 7750 5100 7750
$Comp
L power:GND #PWR04
U 1 1 641869BE
P 5100 9600
F 0 "#PWR04" H 5100 9350 50  0001 C CNN
F 1 "GND" H 5105 9427 50  0000 C CNN
F 2 "" H 5100 9600 50  0001 C CNN
F 3 "" H 5100 9600 50  0001 C CNN
	1    5100 9600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 7750 5100 8300
Wire Wire Line
	2950 5200 3100 5200
Wire Wire Line
	2950 5300 3100 5300
Wire Wire Line
	3650 7100 8900 7100
Wire Wire Line
	5450 7000 8800 7000
Wire Wire Line
	8900 3700 8900 7100
Wire Wire Line
	9000 3700 8900 3700
Wire Wire Line
	9600 3700 9750 3700
Wire Wire Line
	11600 4400 11700 4400
Wire Wire Line
	11600 3000 11600 4400
Wire Wire Line
	11150 6200 13250 6200
Wire Wire Line
	11150 4600 11700 4600
Wire Wire Line
	11150 4700 11700 4700
Wire Wire Line
	11150 4800 11700 4800
Wire Wire Line
	11150 4900 11700 4900
Wire Wire Line
	11150 5000 11700 5000
Wire Wire Line
	11150 5100 11700 5100
Wire Wire Line
	11150 5200 11700 5200
Wire Wire Line
	11150 5300 11700 5300
Wire Wire Line
	6600 6900 8700 6900
Wire Wire Line
	7900 5600 9750 5600
Wire Wire Line
	8000 5500 9750 5500
Wire Wire Line
	8100 5400 9750 5400
Wire Wire Line
	8200 5300 9750 5300
Wire Wire Line
	8300 5200 9750 5200
Wire Wire Line
	8400 5100 9750 5100
Wire Wire Line
	8500 5000 9750 5000
Wire Wire Line
	8600 4900 9750 4900
Wire Wire Line
	8800 4200 9750 4200
Wire Wire Line
	8800 7000 8800 4200
Wire Wire Line
	8700 4100 9750 4100
Wire Wire Line
	8700 6900 8700 4100
Wire Wire Line
	7650 4000 9750 4000
Wire Wire Line
	7800 2500 8000 2500
Wire Wire Line
	7800 2400 8100 2400
Wire Wire Line
	7800 2300 8200 2300
Wire Wire Line
	7800 2200 8300 2200
Wire Wire Line
	7800 2100 8400 2100
Wire Wire Line
	7800 2000 8500 2000
Wire Wire Line
	7800 1900 8600 1900
Connection ~ 8000 2500
Wire Wire Line
	8750 2500 8000 2500
Connection ~ 8100 2400
Wire Wire Line
	8750 2400 8100 2400
Connection ~ 8200 2300
Wire Wire Line
	8750 2300 8200 2300
Connection ~ 8300 2200
Wire Wire Line
	8750 2200 8300 2200
Connection ~ 8400 2100
Wire Wire Line
	8750 2100 8400 2100
Connection ~ 8500 2000
Wire Wire Line
	8750 2000 8500 2000
Connection ~ 8600 1900
Wire Wire Line
	8750 1900 8600 1900
Wire Wire Line
	8000 5500 8000 2500
Wire Wire Line
	8100 5400 8100 2400
Wire Wire Line
	8200 5300 8200 2300
Wire Wire Line
	8300 5200 8300 2200
Wire Wire Line
	8400 5100 8400 2100
Wire Wire Line
	8500 5000 8500 2000
Wire Wire Line
	8600 4900 8600 1900
Wire Wire Line
	6500 4500 9750 4500
Wire Wire Line
	6400 4600 9750 4600
Wire Wire Line
	13950 5000 12900 5000
Wire Wire Line
	13950 3300 13950 5000
Wire Wire Line
	12450 3300 13950 3300
Wire Wire Line
	12450 2300 12450 3300
Wire Wire Line
	13050 2300 12450 2300
Wire Wire Line
	13850 5100 12900 5100
Wire Wire Line
	13850 3400 13850 5100
Wire Wire Line
	12550 3400 13850 3400
Wire Wire Line
	12550 2400 12550 3400
Wire Wire Line
	13050 2400 12550 2400
Wire Wire Line
	13750 5200 12900 5200
Wire Wire Line
	13750 3500 13750 5200
Wire Wire Line
	12650 3500 13750 3500
Wire Wire Line
	12650 2500 12650 3500
Wire Wire Line
	13050 2500 12650 2500
Wire Wire Line
	13650 5300 12900 5300
Wire Wire Line
	13650 3600 13650 5300
Wire Wire Line
	12750 3600 13650 3600
Wire Wire Line
	12750 2600 12750 3600
Wire Wire Line
	13050 2600 12750 2600
Wire Wire Line
	11150 3700 13350 3700
Wire Wire Line
	11150 3800 13250 3800
Wire Wire Line
	11150 3900 11500 3900
Wire Wire Line
	11150 4000 11400 4000
$Comp
L Memory_RAM2:Micro_SD_Card_Kit J2
U 1 1 6188B7C4
P 13950 2200
F 0 "J2" H 13450 2900 50  0000 L CNN
F 1 "Micro_SD_Card_Kit" H 13950 2900 50  0000 L CNN
F 2 "Kicad:AE-microSD-LLCNV" H 15100 2500 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 13950 2200 50  0001 C CNN
	1    13950 2200
	1    0    0    -1  
$EndComp
NoConn ~ 13050 2000
NoConn ~ 13050 2100
NoConn ~ 13050 2700
$Comp
L power:+5V #PWR011
U 1 1 625CD0DA
P 12900 1750
F 0 "#PWR011" H 12900 1600 50  0001 C CNN
F 1 "+5V" H 12915 1923 50  0000 C CNN
F 2 "" H 12900 1750 50  0001 C CNN
F 3 "" H 12900 1750 50  0001 C CNN
	1    12900 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	12900 1750 12900 1900
Wire Wire Line
	12900 1900 13050 1900
$Comp
L power:GND #PWR012
U 1 1 625DAB5A
P 12900 2850
F 0 "#PWR012" H 12900 2600 50  0001 C CNN
F 1 "GND" H 12905 2677 50  0000 C CNN
F 2 "" H 12900 2850 50  0001 C CNN
F 3 "" H 12900 2850 50  0001 C CNN
	1    12900 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13050 2200 12900 2200
Wire Wire Line
	12900 2200 12900 2850
Wire Wire Line
	13100 4500 13100 4200
Wire Wire Line
	12900 4500 13100 4500
NoConn ~ 11700 4200
NoConn ~ 11700 4300
NoConn ~ 11700 4500
NoConn ~ 12200 5700
NoConn ~ 12300 5700
NoConn ~ 12900 4400
NoConn ~ 12900 4200
NoConn ~ 11150 6100
NoConn ~ 11150 6000
NoConn ~ 11150 5900
NoConn ~ 11150 5800
NoConn ~ 11150 5600
NoConn ~ 11150 5500
NoConn ~ 11150 4400
NoConn ~ 11150 4300
NoConn ~ 11150 4200
NoConn ~ 11150 4100
$Comp
L power:+5V #PWR010
U 1 1 621E99AD
P 13100 4200
F 0 "#PWR010" H 13100 4050 50  0001 C CNN
F 1 "+5V" H 13115 4373 50  0000 C CNN
F 2 "" H 13100 4200 50  0001 C CNN
F 3 "" H 13100 4200 50  0001 C CNN
	1    13100 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	13000 4300 13000 5500
Wire Wire Line
	12900 4300 13000 4300
$Comp
L power:GND #PWR09
U 1 1 621A9C99
P 13000 5500
F 0 "#PWR09" H 13000 5250 50  0001 C CNN
F 1 "GND" H 13005 5327 50  0000 C CNN
F 2 "" H 13000 5500 50  0001 C CNN
F 3 "" H 13000 5500 50  0001 C CNN
	1    13000 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	12500 5900 12500 5700
Wire Wire Line
	11400 5900 12500 5900
Wire Wire Line
	11400 4000 11400 5900
Wire Wire Line
	12400 5800 12400 5700
Wire Wire Line
	11500 5800 12400 5800
Wire Wire Line
	11500 3900 11500 5800
Wire Wire Line
	13250 4600 12900 4600
Wire Wire Line
	13250 3800 13250 4600
Wire Wire Line
	13350 4700 12900 4700
Wire Wire Line
	13350 3700 13350 4700
Wire Wire Line
	13350 4800 12900 4800
Wire Wire Line
	13350 6300 13350 4800
Wire Wire Line
	11300 6300 13350 6300
Wire Wire Line
	11300 5700 11300 6300
Wire Wire Line
	11150 5700 11300 5700
Wire Wire Line
	13250 4900 12900 4900
Wire Wire Line
	13250 6200 13250 4900
Connection ~ 10450 3400
$Comp
L power:+5V #PWR07
U 1 1 61F63930
P 10450 3400
F 0 "#PWR07" H 10450 3250 50  0001 C CNN
F 1 "+5V" H 10465 3573 50  0000 C CNN
F 2 "" H 10450 3400 50  0001 C CNN
F 3 "" H 10450 3400 50  0001 C CNN
	1    10450 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3400 10450 3400
Wire Wire Line
	9700 6650 9700 3400
Wire Wire Line
	9800 6650 9700 6650
Connection ~ 10450 6650
Wire Wire Line
	10450 6600 10450 6650
Wire Wire Line
	10450 6650 10450 6700
Wire Wire Line
	10100 6650 10450 6650
$Comp
L power:GND #PWR08
U 1 1 61F38F70
P 10450 6700
F 0 "#PWR08" H 10450 6450 50  0001 C CNN
F 1 "GND" H 10455 6527 50  0000 C CNN
F 2 "" H 10450 6700 50  0001 C CNN
F 3 "" H 10450 6700 50  0001 C CNN
	1    10450 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 61F2D5C6
P 9950 6650
F 0 "C4" V 9800 6750 50  0000 C CNN
F 1 "0.1uF" V 9800 6500 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 9988 6500 50  0001 C CNN
F 3 "~" H 9950 6650 50  0001 C CNN
	1    9950 6650
	0    -1   -1   0   
$EndComp
$Comp
L Interface:8255 U4
U 1 1 618A36EE
P 10450 5000
F 0 "U4" H 10050 6500 50  0000 C CNN
F 1 "8255" H 10850 6500 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 10450 5300 50  0001 C CNN
F 3 "http://aturing.umcs.maine.edu/~meadow/courses/cos335/Intel8255A.pdf" H 10450 5300 50  0001 C CNN
	1    10450 5000
	1    0    0    -1  
$EndComp
$Comp
L Arduino:Arduino_Pro_Mini U7
U 1 1 61A254A8
P 12300 4800
F 0 "U7" H 12300 5689 60  0000 C CNN
F 1 "Arduino_Pro_Mini_5V" H 12300 5583 60  0000 C CNN
F 2 "Kicad:Arduino_Pro_Mini" H 13100 4050 60  0001 C CNN
F 3 "https://www.sparkfun.com/products/11113" H 12500 3600 60  0001 C CNN
	1    12300 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 7600 8950 7600
Wire Wire Line
	8500 8100 8500 7600
Connection ~ 8500 7600
Connection ~ 7850 7600
Wire Wire Line
	7850 7600 7850 7700
Wire Wire Line
	7400 7600 7850 7600
Wire Wire Line
	7850 7600 8500 7600
Wire Wire Line
	3650 6550 5900 6550
Wire Wire Line
	3150 8050 2950 8050
Wire Wire Line
	2250 2900 2450 2900
Text Label 8750 1900 0    50   ~ 0
D0
Text Label 8750 2000 0    50   ~ 0
D1
Text Label 8750 2100 0    50   ~ 0
D2
Text Label 8750 2200 0    50   ~ 0
D3
Text Label 8750 2300 0    50   ~ 0
D4
Text Label 8750 2400 0    50   ~ 0
D5
Text Label 8750 2500 0    50   ~ 0
D6
Text Label 8750 2600 0    50   ~ 0
D7
Wire Wire Line
	6400 2000 6150 2000
Wire Wire Line
	2250 3900 2450 3900
Wire Wire Line
	6500 1900 6150 1900
Wire Wire Line
	2250 3800 2450 3800
Text Label 6150 1900 0    50   ~ 0
A0
Text Label 6150 2000 0    50   ~ 0
A1
Text Label 3850 2100 0    50   ~ 0
A2
Text Label 3850 2200 0    50   ~ 0
A3
Text Label 3850 2300 0    50   ~ 0
A4
Text Label 3850 2400 0    50   ~ 0
A5
Text Label 3850 2500 0    50   ~ 0
A6
Text Label 3850 2600 0    50   ~ 0
A7
Text Label 5450 6900 0    50   ~ 0
~RD
Text Label 5450 7000 0    50   ~ 0
~WR
Text Label 3150 8050 0    50   ~ 0
Vcc
Text Label 3650 6550 0    50   ~ 0
~IORQ
Text Label 3850 2700 0    50   ~ 0
A8
Text Label 3850 2800 0    50   ~ 0
A9
Text Label 3850 2900 0    50   ~ 0
A10
Text Label 3850 3000 0    50   ~ 0
A11
Text Label 3850 3100 0    50   ~ 0
A12
Text Label 3650 7100 0    50   ~ 0
~RESET
Wire Wire Line
	2350 8250 2350 8400
$Comp
L power:PWR_FLAG #FLG01
U 1 1 61C4340B
P 2350 8250
F 0 "#FLG01" H 2350 8325 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 8350 50  0000 C CNN
F 2 "" H 2350 8250 50  0001 C CNN
F 3 "~" H 2350 8250 50  0001 C CNN
	1    2350 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 8400 2950 8400
Wire Wire Line
	2950 8400 2950 8350
Wire Wire Line
	2950 8400 2950 8500
Connection ~ 2950 8400
Wire Wire Line
	2950 3400 3100 3400
Wire Wire Line
	6500 5650 6800 5650
Wire Wire Line
	6800 5650 6800 5750
Wire Wire Line
	6800 5750 6950 5750
Wire Wire Line
	4600 5650 5900 5650
Wire Wire Line
	2450 5000 2250 5000
Wire Wire Line
	2450 5100 2250 5100
Wire Wire Line
	2450 5200 2250 5200
Wire Wire Line
	2450 5300 2250 5300
Text Label 2250 5000 0    50   ~ 0
GND
Text Label 2250 5100 0    50   ~ 0
+5V
Text Label 2250 5200 0    50   ~ 0
+5V
Text Label 2250 5300 0    50   ~ 0
-5V
Wire Wire Line
	2950 2900 3100 2900
Wire Wire Line
	2950 3000 3100 3000
Wire Wire Line
	2950 3100 3100 3100
Wire Wire Line
	2950 3200 3100 3200
Wire Wire Line
	2950 3300 3100 3300
Wire Wire Line
	2950 3500 3100 3500
Wire Wire Line
	2950 3600 3100 3600
Wire Wire Line
	2950 3700 3100 3700
Wire Wire Line
	2950 4700 3100 4700
Wire Wire Line
	2950 4800 3100 4800
Wire Wire Line
	2950 4900 3100 4900
Text Label 2950 2900 0    50   ~ 0
~CS3
Text Label 2950 3000 0    50   ~ 0
~CS2
Text Label 2950 3100 0    50   ~ 0
~EROM
Text Label 2950 3200 0    50   ~ 0
~NMI
Text Label 2950 3300 0    50   ~ 0
~EXCAS
Text Label 2950 3500 0    50   ~ 0
~RD
Text Label 2950 3600 0    50   ~ 0
~CLK16M
Text Label 2950 3700 0    50   ~ 0
A15
Text Label 2950 4700 0    50   ~ 0
D4
Text Label 2950 4800 0    50   ~ 0
D6
Text Label 2950 4900 0    50   ~ 0
CLK
Text Label 2950 5000 0    50   ~ 0
MSW1
Text Label 2950 5100 0    50   ~ 0
MSW2
Wire Wire Line
	3250 5000 3250 5100
Wire Wire Line
	2950 5000 3250 5000
Wire Wire Line
	2950 5100 3250 5100
Text Label 6100 3500 0    50   ~ 0
~CS2
NoConn ~ 2250 3100
NoConn ~ 2250 3200
NoConn ~ 2250 3300
NoConn ~ 2250 5300
NoConn ~ 3100 5300
NoConn ~ 3100 5200
NoConn ~ 3100 4900
NoConn ~ 3100 3600
NoConn ~ 3100 3100
NoConn ~ 3100 3200
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J1
U 1 1 61ABAF01
P 2650 4100
F 0 "J1" H 2700 2675 50  0000 C CNN
F 1 "PC-8001 BUS" H 2700 2766 50  0000 C CNN
F 2 "PC-6001:BUS_50Pin" H 2650 4100 50  0001 C CNN
F 3 "~" H 2650 4100 50  0001 C CNN
	1    2650 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 63237747
P 14900 3600
F 0 "J3" H 14850 3150 50  0000 L CNN
F 1 "MicroSD Card Adapter" H 14400 3000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 14900 3600 50  0001 C CNN
F 3 "~" H 14900 3600 50  0001 C CNN
	1    14900 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	14700 3400 14400 3400
Wire Wire Line
	14700 3500 14400 3500
Wire Wire Line
	14700 3600 14400 3600
Wire Wire Line
	14700 3700 14400 3700
Wire Wire Line
	14700 3800 14400 3800
Wire Wire Line
	14700 3900 14400 3900
Text Label 14400 3400 0    50   ~ 0
GND
Text Label 14400 3500 0    50   ~ 0
+5V
Text Label 14400 3600 0    50   ~ 0
MISO
Text Label 14400 3700 0    50   ~ 0
MOSI
Text Label 14400 3800 0    50   ~ 0
SCK
Text Label 14400 3900 0    50   ~ 0
CS
Text Label 12450 2300 0    50   ~ 0
SCK
Text Label 12550 2400 0    50   ~ 0
MISO
Text Label 12650 2500 0    50   ~ 0
MOSI
Text Label 12750 2600 0    50   ~ 0
CS
$Comp
L 74xx:74LS04 U1
U 1 1 63409D19
P 10100 3000
F 0 "U1" H 9800 3250 50  0000 C CNN
F 1 "74LS04" H 10200 3250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 10100 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10100 3000 50  0001 C CNN
	1    10100 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 2 1 63411FC0
P 5550 7750
F 0 "U1" H 5550 8067 50  0000 C CNN
F 1 "74LS04" H 5550 7976 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 7750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 7750 50  0001 C CNN
	2    5550 7750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 3 1 6341339E
P 5550 8300
F 0 "U1" H 5550 8617 50  0000 C CNN
F 1 "74LS04" H 5550 8526 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 8300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 8300 50  0001 C CNN
	3    5550 8300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 3000 9600 3000
Wire Wire Line
	9600 3000 9600 3700
Connection ~ 9600 3700
Wire Wire Line
	10400 3000 11600 3000
NoConn ~ 5850 7750
NoConn ~ 5850 8300
Wire Wire Line
	5250 8300 5100 8300
Wire Wire Line
	5100 9550 5100 9600
$Comp
L Memory_RAM:HM62256BLP U6
U 1 1 634443C3
P 7500 11200
F 0 "U6" H 7100 12150 50  0000 C CNN
F 1 "HM62256BLP" H 7900 12150 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 7500 11100 50  0001 C CNN
F 3 "https://web.mit.edu/6.115/www/document/62256.pdf" H 7500 11100 50  0001 C CNN
	1    7500 11200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 12850 8350 12850
Wire Wire Line
	8350 12850 8350 11400
Wire Wire Line
	8350 11400 8000 11400
$Comp
L 74xx:74LS32 U3
U 3 1 63461246
P 5550 9450
F 0 "U3" H 5550 9775 50  0000 C CNN
F 1 "74LS32" H 5550 9684 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 9450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5550 9450 50  0001 C CNN
	3    5550 9450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 12550 4150 12550
Wire Wire Line
	4150 12550 4150 12750
Wire Wire Line
	4150 12750 4300 12750
Wire Wire Line
	4150 12950 4300 12950
Wire Wire Line
	3350 12450 2900 12450
Wire Wire Line
	3350 12650 2900 12650
Wire Wire Line
	6800 11900 7000 11900
Text Label 2900 12450 0    50   ~ 0
~RAS2
Text Label 2900 12650 0    50   ~ 0
~EXCAS
Wire Wire Line
	7000 11800 6800 11800
Wire Wire Line
	7000 11700 6800 11700
Wire Wire Line
	7000 11600 6800 11600
Wire Wire Line
	7000 11500 6800 11500
Wire Wire Line
	7000 11400 6800 11400
Wire Wire Line
	7000 11300 6800 11300
Wire Wire Line
	7000 11200 6800 11200
Wire Wire Line
	7000 11100 6800 11100
Wire Wire Line
	7000 11000 6800 11000
Wire Wire Line
	7000 10900 6800 10900
Wire Wire Line
	7000 10800 6800 10800
Wire Wire Line
	7000 10700 6800 10700
Wire Wire Line
	7000 10600 6800 10600
Wire Wire Line
	7000 10500 6800 10500
Wire Wire Line
	8000 10500 8250 10500
Wire Wire Line
	8000 10600 8250 10600
Wire Wire Line
	8000 10700 8250 10700
Wire Wire Line
	8000 10800 8250 10800
Wire Wire Line
	8000 10900 8250 10900
Wire Wire Line
	8000 11000 8250 11000
Wire Wire Line
	8000 11100 8250 11100
Wire Wire Line
	8000 11200 8250 11200
Wire Wire Line
	8000 11700 8250 11700
Wire Wire Line
	8000 11600 8450 11600
Wire Wire Line
	8450 11600 8450 14100
Wire Wire Line
	8450 14100 4900 14100
Text Label 4900 14100 0    50   ~ 0
~DRD2
Text Label 8050 11700 0    50   ~ 0
~WR
Text Label 6800 10500 0    50   ~ 0
A0
Text Label 6800 10600 0    50   ~ 0
A1
Text Label 6800 10700 0    50   ~ 0
A2
Text Label 6800 10800 0    50   ~ 0
A3
Text Label 6800 10900 0    50   ~ 0
A4
Text Label 6800 11000 0    50   ~ 0
A5
Text Label 6800 11100 0    50   ~ 0
A6
Text Label 6800 11200 0    50   ~ 0
A7
Text Label 6800 11300 0    50   ~ 0
A8
Text Label 6800 11400 0    50   ~ 0
A9
Text Label 6800 11500 0    50   ~ 0
A10
Text Label 6800 11600 0    50   ~ 0
A11
Text Label 6800 11700 0    50   ~ 0
A12
Text Label 6800 11800 0    50   ~ 0
A13
Text Label 8050 10500 0    50   ~ 0
D0
Text Label 8050 10600 0    50   ~ 0
D1
Text Label 8050 10700 0    50   ~ 0
D2
Text Label 8050 10800 0    50   ~ 0
D3
Text Label 8050 10900 0    50   ~ 0
D4
Text Label 8050 11000 0    50   ~ 0
D5
Text Label 8050 11100 0    50   ~ 0
D6
Text Label 8050 11200 0    50   ~ 0
D7
$Comp
L power:GND #PWR02
U 1 1 63488437
P 7500 12500
F 0 "#PWR02" H 7500 12250 50  0001 C CNN
F 1 "GND" H 7505 12327 50  0000 C CNN
F 2 "" H 7500 12500 50  0001 C CNN
F 3 "" H 7500 12500 50  0001 C CNN
	1    7500 12500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 634C07EB
P 7050 12150
F 0 "C3" V 6900 12250 50  0000 C CNN
F 1 "0.1uF" V 6900 12000 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 7088 12000 50  0001 C CNN
F 3 "~" H 7050 12150 50  0001 C CNN
	1    7050 12150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7500 12100 7500 12150
Wire Wire Line
	7200 12150 7500 12150
Connection ~ 7500 12150
Wire Wire Line
	6900 12150 6550 12150
Wire Wire Line
	6550 12150 6550 10150
Wire Wire Line
	6550 10150 7500 10150
Wire Wire Line
	7500 10150 7500 10300
$Comp
L power:+5V #PWR01
U 1 1 63555D97
P 7500 10150
F 0 "#PWR01" H 7500 10000 50  0001 C CNN
F 1 "+5V" H 7515 10323 50  0000 C CNN
F 2 "" H 7500 10150 50  0001 C CNN
F 3 "" H 7500 10150 50  0001 C CNN
	1    7500 10150
	1    0    0    -1  
$EndComp
Connection ~ 7500 10150
$Comp
L 74xx:74LS32 U3
U 1 1 635B2229
P 4600 12850
F 0 "U3" H 4600 13175 50  0000 C CNN
F 1 "74LS32" H 4600 13084 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4600 12850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4600 12850 50  0001 C CNN
	1    4600 12850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U3
U 2 1 635BD365
P 3650 12550
F 0 "U3" H 3650 12875 50  0000 C CNN
F 1 "74LS32" H 3650 12784 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3650 12550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3650 12550 50  0001 C CNN
	2    3650 12550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U3
U 5 1 635CC6B6
P 10200 8200
F 0 "U3" H 10430 8246 50  0000 L CNN
F 1 "74LS32" H 10430 8155 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 10200 8200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 10200 8200 50  0001 C CNN
	5    10200 8200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 636F0B48
P 9750 8250
F 0 "C6" V 9600 8350 50  0000 C CNN
F 1 "0.1uF" V 9600 8100 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 9788 8100 50  0001 C CNN
F 3 "~" H 9750 8250 50  0001 C CNN
	1    9750 8250
	-1   0    0    1   
$EndComp
Wire Wire Line
	9750 8400 9750 8800
Wire Wire Line
	10200 8800 10200 8700
Connection ~ 8950 8800
Connection ~ 9750 8800
Wire Wire Line
	9750 8800 10200 8800
Wire Wire Line
	10200 7600 10200 7700
Connection ~ 8950 7600
Wire Wire Line
	9750 8100 9750 7600
Connection ~ 9750 7600
Wire Wire Line
	9750 7600 10200 7600
Wire Wire Line
	5100 9550 5250 9550
Connection ~ 5100 8300
Connection ~ 5100 9550
Wire Wire Line
	5250 8800 5100 8800
Connection ~ 5100 8800
Wire Wire Line
	5100 8800 5100 9000
Wire Wire Line
	5250 9000 5100 9000
Connection ~ 5100 9000
Wire Wire Line
	5100 9000 5100 9350
Wire Wire Line
	5250 9350 5100 9350
Connection ~ 5100 9350
Wire Wire Line
	5100 9350 5100 9550
NoConn ~ 5850 8900
NoConn ~ 5850 9450
Wire Wire Line
	6600 3600 7000 3600
Wire Wire Line
	6100 3500 7000 3500
$Comp
L Memory_RAM2:SLIDE_SWITCH_3P S1
U 1 1 636AC2BA
P 3100 12900
F 0 "S1" H 3100 12965 50  0000 C CNN
F 1 "32k   16k" H 3100 12874 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3100 12925 50  0001 C CNN
F 3 "" H 3100 12925 50  0001 C CNN
	1    3100 12900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 636E3223
P 3550 13100
F 0 "#PWR018" H 3550 12950 50  0001 C CNN
F 1 "+5V" H 3565 13273 50  0000 C CNN
F 2 "" H 3550 13100 50  0001 C CNN
F 3 "" H 3550 13100 50  0001 C CNN
	1    3550 13100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 13100 3550 13100
$Comp
L power:GND #PWR03
U 1 1 637410B9
P 2750 13150
F 0 "#PWR03" H 2750 12900 50  0001 C CNN
F 1 "GND" H 2755 12977 50  0000 C CNN
F 2 "" H 2750 13150 50  0001 C CNN
F 3 "" H 2750 13150 50  0001 C CNN
	1    2750 13150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 13100 2750 13100
Wire Wire Line
	2750 13100 2750 13150
Connection ~ 7400 3900
Wire Wire Line
	7500 12150 7500 12400
Wire Wire Line
	6800 11900 6800 12400
Wire Wire Line
	6800 12400 7500 12400
Connection ~ 7500 12400
Wire Wire Line
	7500 12400 7500 12500
Wire Wire Line
	5100 8300 5100 8800
Wire Wire Line
	8950 8800 9750 8800
Wire Wire Line
	8950 7600 9750 7600
$Comp
L 74xx:74LS32 U3
U 4 1 639A5040
P 5550 8900
F 0 "U3" H 5550 9225 50  0000 C CNN
F 1 "74LS32" H 5550 9134 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 8900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5550 8900 50  0001 C CNN
	4    5550 8900
	1    0    0    -1  
$EndComp
$Comp
L Memory_EPROM:2764 U5
U 1 1 639FA8B8
P 7400 2700
F 0 "U5" H 7150 3750 50  0000 C CNN
F 1 "2764" H 7600 3700 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 7400 2700 50  0001 C CNN
F 3 "https://downloads.reactivemicro.com/Electronics/ROM/2764%20EPROM.pdf" H 7400 2700 50  0001 C CNN
	1    7400 2700
	1    0    0    -1  
$EndComp
Connection ~ 7400 1700
Wire Wire Line
	4150 12950 4150 13400
Wire Wire Line
	4150 13400 3100 13400
Wire Wire Line
	3100 13400 3100 13250
NoConn ~ 3100 3400
NoConn ~ 3100 3700
NoConn ~ 2250 4100
NoConn ~ 3100 2900
$EndSCHEMATC
