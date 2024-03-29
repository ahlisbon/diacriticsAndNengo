# Diacritics & Nengō
A set of simple macros to:
- quickly type romanized Japanese vowels with macrons (ex: ō) and Korean vowels with breves (ex: ŭ).
- convert Western years to [Japanese imperial era years (nengō/年号)](https://en.wikipedia.org/wiki/Japanese_era_name#Neng%C5%8D_in_modern_Japan) and vice versa from 1868/Meiji 1 onward.

These macros were created in [AutoHotKey (AHK)](https://www.autohotkey.com/) and are part of self executing file that launches a tiny stand alone program in the background.

# Getting Started

## Prerequisites
- for PCs only.
- This guide assumes limited experience with coding and using GitHub itself.

## Downloading and Using
1. [Download  Diacritics and Nengo.exe](https://github.com/ahlisbon/diacriticsAndNengo/raw/master/Diacritics%20and%20Nengo.exe)
2. Double click the "Diacritics and Nengo.exe" file after the download finishes.
   - You will see a green square with a white "H" in the Windows taskbar on the lower-right. If not, click the up arrow to see if it's in the expanded grid of background programs running on your PC. You should see it there.
3. These scripts are activated by tapping a "hot key" (or key combination) on your keyboard. For example, if you type the *right alt+y*, your computer will type ¥.
4. Read the rest of the README.

## Editing, Updating, Playing with the Code (Optional)
### If you would like to see the code and edit yourself, make sure you have installed [AutoHotKey first](https://www.autohotkey.com/).
- After installing, create a new AutoHotKey file. You can usually do this by right clicking on your desktop or in a folder.
  - Select "New" and then " AutoHotKey Script"
  - Name the file
  - Right click the file you just created, select "Edit Script"
- This will most likely cause Note Pad to open, you can now paste the AHK code in this window and save the file as an AHK file.
- Go to the [raw code](https://raw.githubusercontent.com/ahlisbon/diacriticsAndNengo/master/Diacritics%20and%20Nengo.ahk) hosted on Github.
- Select all of the textg (ctrl+a) and copy it to Notepad.
- Save the file.
- You can now edit the script.

### For script editing. I highly recommend using [Notepad++](https://notepad-plus-plus.org/downloads/)
 - After installing Notepad++ you can drag and drop a file into its window to edit it.
 - Or you can right click an AHK file and select "Edit with Notepad++"

# Typing Vowels with Diacritics

Romanized Japanese and Korean require diacritics. Use these hot key combinations to quickly type the following:

## Long-Vowels in Romanized Japanese
- *right alt+a* = ā
- *right alt+i* = ī
- *right alt+u* = ū
- *right alt+e* = ē
- *right alt+o* = ō

- *right alt+right shift+a* = Ā
- *right alt+right shift+i* = Ī
- *right alt+right shift+u* = Ū
- *right alt+right shift+e* = Ē
- *right alt+right shift+o* = Ō

## Korean Vowels with Diacritics
- *right ctrl+o* = ŏ
- *right ctrl+u* = ŭ

- *right ctrl+right shift+o* = Ŏ
- *right ctrl+right shift+u* = Ŭ

# Currency Symbols
- *right alt+y* = ¥
- *right ctrl+w* = ₩

# Converting Western Years ⇄ Nengō
*ctrl+shift+y* is the hotkey combination for converting years.

This macro lets you convert years as you are typing. The macro accounts for three scenarios:
- typing in word processors
- typing in text fields
- spreadsheets with a year already in the cell

## Converting Years in Word Processors or Text Fields
Type out any 4 digit western year or nengō with the appropriate era prefix, then enter the hotkey *ctrl+shift+y*.

## Converting Years in Spreadsheets
Spreadsheets are the most complex software environment for the macro to handle. The macro is compatible with:
- Excel
- Excel's web app in Office365 
- Google Sheets

If you use other spreadsheet software, the macro may not work correctly. Please [email me](mailto:adam.lisbon@colorado.edu) if you use something not listed above and would like me to try and make the macro compatible with it.

★ When converting a year in a spreadsheet cell, you cannot be editing the cell. The macro can only convert cells with a date already entered in them.

### Western Years to Nengō
Type any 4 digit year from 1868 onward and then press *ctrl+shift+y*. The macro will highlight the text and paste the nengō over it. For example 1936 will be pasted over as: "Shōwa 11". In spreadsheets the year needs to already be in the cell.

#### Things to Know about converting Western Years:
- Years will not be converted before 1868 (Meiji 1).
- The macro will NOT convert Western years that fall on a year when the imperial era changes.
  - e.g. 1868, 1912, 1926, 1989, 2019
  - Because the last and first year of two succeeding imperial eras can happen in the same Western year.
  - An alert message will appear explaining the exact dates one era ends and the other begins.
- 2020 thorugh 2030 will be converted to Reiwa era nengō. No conversion or error message will appear for years higher than 2030.

### Nengō to Western Years
Type the first letter of the name of an imperial era, then the two digit year **with no space between the letter and the year**, then press *ctrl+shift+y*. For example, "s20" will be converted to "1945", "h12" will be converted to "2000", and so on. "s 20" adn "h 12" would not be recognized as years to convert.
- m = Meiji
- t = Taishō
- s = Shōwa
- h = Heisi
- r = Reiwa

#### Things to Know about Converting Nengō:
- Trying to convert a year past the end of an imperial era will produce an error message.
- These is no limit on the number of years for the Reiwa era. For example, "r700" will be converted into 2718.

# Known Issues
- On rare occaisions, the macro will leave either the "ctrl" "shift" or "alt" key pressed down. I.e., presseing the "p" key will be interpreted by your computer as "ctrl+p" and launch the print dialogue window. To fix this, seperately press "ctrl" "shift" and "alt". This will stop the behavior.
- If you type some gibberish, and the gibberish has one of the letters used to prefix imperial eras (m, t, s, h, r), the error message for exceeding the maximum number of years in an imperial era will display.

# Future Changes/Features/Ideas (in no particular order)
- Improve compatibility with spreadsheet software/web apps.
- Impliment a GUI.
- Option to paste years in [ ] to assist library catalogers.
- Option to paste  years in Japanese, i.e., "昭和30".
- Ability to detect and copy phrases like "taisho 4" "taishō 4" "大正4" and "大正四
- The ability to cyle between o, ō, and ŏ; u, ū, and ŭ; instead of using seperate hot keys.
- Eliminate specific hot keys for each letter. Instead, type any one letter that can potentially have a diacritic and have one hotkey that looks at the last character typed and adds the appropriate diacritic. 
  - Would pair extremely well with the above idea for cycling letters with one diacritic.
  - Would also apply to currency symbols.
- Convert Western Years ⇄ nengō **before** before 1868
  - Labor intensive because of so many imperial eras.
  - Would require the use of YYYYMMDD date format to account for nengō changing during a Western year.

# About
- version: 1.3
- released: 2022/02/17 (yyyy/mm/dd)

## Created By:
Adam H. Lisbon  
Japanese & Korean Studies Librarian  
Associate Professor  
University Libraries  
University of Colorado Boulder  

## License:
See [LICENSE.md](https://github.com/ahlisbon/diacriticsAndNengo/blob/master/LICENSE.md)
