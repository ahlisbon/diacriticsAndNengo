;About:
;version: 1.2
;released: 2020/09/22 (yyyy/mm/dd)

;------------------------------------------------------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

setTitleMatchMode, 2
setKeyDelay, 100

;------------------------------------------------------------
;keyboard commands for typing Japanese vowels in Romaji with macrons.
>!a:: sendInput ā
>!i:: sendInput ī
>!u:: sendInput ū
>!e:: sendInput ē
>!o:: sendInput ō
>+!a:: sendInput Ā
>+!i:: sendInput Ī
>+!u:: sendInput Ū
>+!e:: sendInput Ē
>+!o:: sendInput Ō
>!y:: sendInput ¥

;------------------------------------------------------------
;keyboard command for typing Korean vowels in Romanization with accent marks.
>^o:: sendInput ŏ
>^u:: sendInput ŭ
>+^o:: sendInput Ŏ
>+^u:: sendInput Ŭ
>^w:: sendInput ₩

;------------------------------------------------------------
^+y::
;clears data from variables.
	clipboard:= ""
	spreadsheet:= ""
	year:= ""
;determines if you are using a spreadsheet program.
;can currently check the following spreadsheet programs and web apps:
;Excel, Excel in Office365, Google Sheets
	if WinActive("ahk_class XLMAIN")
		spreadsheet:= "Excel"
	if WinActive(" - Google Sheets")
		spreadsheet:= "Google Sheets"
	if WinActive(".xlsx - ")
		spreadsheet:= "Excel via Office365"
	if (spreadsheet!= "")
		{
		send ^c
		clipWait
		year:= regExReplace(clipboard, "`r`n","") ;some spreadsheet data is not true plain text and needs to have "carriage return" and "line feed" formatting removed.
		if (year= "")
			{
			msgBox, You may be actively editing or trying to copy a blank cell in %spreadsheet%.`n`n1. Finish editing the cell.`n2. Highlight the cell with the year you want to convert. 
			return
			}
		goTo skipCopy
		}
	send ^+{left}
	send ^c
	skipCopy:
	year:= regExReplace(clipboard, "`r`n","")
	sleep 300
;years where the Western Year is when the Japanese Imperial era changes.
	if (year < 1868)
		{
		msgBox, This macro only converts dates after 1868.
		return
		}
	switch year
		{
		case 1868:
			msgBox, Caution!`n`n1868 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before September 7, 1868 is Keiō 4`n--on or after September 8, 1868 is Meiji 1`n`n This macro does not convert years when the imperial era changes.
			return
		case 1912:
			msgBox, Caution!`n`n1912 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before June 11, 1912 is Meiji 45`n--on or after June 12, 1868 is Taishō 1`n`n This macro does not convert years when the imperial era changes.
			return
		case 1926:
			msgBox, Caution!`n`n1926 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before December 26, 1926 is Taishō 15`n--on or after December 25, 1926 is Shōwa 1`n`n This macro does not convert years when the imperial era changes.
			return
		case 1989:
			msgBox, Caution!`n`n1989 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before January 7, 1989 is Shōwa 64`n--on or after January 8, 1989 is Shōwa 1`n`n This macro does not convert years when the imperial era changes.
			return
		case 2019:
			msgBox, Caution!`n`n2019 is a year when the imperial era changes.`n`nYou need to know the month and day of the date you are converting:`n`n--on or before April 30, 2019 is Heisei 31`n--on or after May 1, 2019 is Reiwa 1`n`n This macro does not convert years when the imperial era changes.
			return
		}
;number checked for initial letter indicating an imperial era.
;conversion from Western years to Nengō.
	if year not contains m,t,s,h,r
		{
		if year between 1868 and 1912
			{
			year:= year - 1867
			year:= "Meiji " . year
			}
		if year between 1912 and 1926
			{
			year:= year - 1911
			year:= "Taishō " . year
			}
		if year between 1926 and 1997
			{
			year:= year - 1925
			year:= "Shōwa " . year
			}
		if year between 1998 and 2018
			{
			year:= year - 1988
			year:= "Heisei " . year
			}
		if year between 2019 and 2030
			{
			year:= year - 2018
			year:= "Reiwa " . year
			}
		goTo pasteYear
		}
;conversion from Nengō to Western year.
;Meiji era
	if inStr(year, "m")
		{
		year:= strReplace(year, "m", "")
		if year > 45
			{
			MsgBox, Error. The Meiji era ends in Meiji 45.
			return
			}
		year:= year + 1867
		}
;Taishō Era
	if inStr(year, "t")
		{
		year:= strReplace(year, "t", "")
		if (year > 15)
			{
			msgBox, Error. The Taishō era ends in Taishō 15.
			return
			}
		year:= year + 1911
		}
;Shōwa Era
	if inStr(year, "s")
		{
		year:= strReplace(year, "s", "")
		if (year > 64)
			{
			MsgBox, Error. The Shōwa era ends in Shōwa 64.
			return
			}
		year:= year + 1925
		}
;Heisei Era
	if inStr(year, "h")
		{
		year:= strReplace(year, "h", "")
		if year > 31
			{
			MsgBox, Error. The Heisei era ends in Heisei 31.
			return
			}
		year:= year + 1988
		}
;Reiwa Era
	if inStr(year, "r")
		{
		year:= strReplace(year, "r", "")
		year:= year + 2018
		}
	pasteYear:
	sendInput %year%
	if spreadsheet= Excel
		send {enter}
	if spreadsheet= Excel via Office365
		send {enter}
	if spreadsheet= Google Sheets
		send {enter 2}
return

\:: reload