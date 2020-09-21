# Macrons & Nengō
A set of simple macros to quickly type romanized Japanese vowels with macrons (ex: ō) and Korean vowels with breves (ex: ŭ). It also allows for quick "on the fly" conversion of Western years to [Japanese imperial era years (nengō/年号)](https://en.wikipedia.org/wiki/Japanese_era_name#Neng%C5%8D_in_modern_Japan) and vice versa from 1868/Meiji 1 onward. These macros were created in [AutoHotKey (AHK)](https://www.autohotkey.com/) and are contatined in a self executing file that launches a tiny stand alone program in the background.

## Features include:
- Quickly type vowels with macrons（ex: ō) in [Hepburn](https://en.wikipedia.org/wiki/Hepburn_romanization) romanization.
  - Including the ¥ symbol.
- Quckly type a breve (ex: ŏ) for romanizing Korean in [McCune–Reischauer](https://en.wikipedia.org/wiki/McCune%E2%80%93Reischauer) romanization.
  - Including the ₩ symbol.
- Quick Western ⇄ Nengō conversion from 1868 onward.

# Getting Started

## Prerequisites
- for PCs only.

## Installing
1. Download the "marconsAndNengo.ahk" file from the GitHub project home page.
2. Double click the "macronAndNengo.ahk" file after you've downloaded the file.
   - You will see a green square with a white "H" in the Windows taskbar on the lower-right. If not, click the up arrow to see if it's in the expanded grid of background programs running on your PC. You should see it there.
3. Consult the "How to Use" section below to know which key combinations activate each feature.
4. Also be sure to read:
   - the detailed instructions on swapping the IME with the Caps Lock key
   - how to do year conversions.

# How to Use
These scripts are activated by tapping a "hot key" (or key combination) on your keyboard. For example, if you type the right alt+y, your computer will type ¥.

## Typing Vowels with Diacritics
Trying to type long-vowels in Japanese or certain vowels in Korean requires diacritics. Use these hot key combinations to quickly type the following:

### Long-Vowels in Romanized Japanese
- right alt+a = ā
- right alt+i = ī
- right alt+u = ū
- right alt+e = ē
- right alt+o = ō

- right alt+right shift+a = Ā
- right alt+right shift+i = Ī
- right alt+right shift+u = Ū
- right alt+right shift+e = Ē
- right alt+right shift+o = Ō

### Korean Vowels with Diacritics
- right ctrl+o = ŏ
- right ctrl+u = ŭ

- right ctrl+right shift+o = Ŏ
- right ctrl+right shift+u = Ŭ

## Currency Symbols
- right alt+y = ¥
- right ctrl+w = ₩

## Converting Western Years ⇄ Nengō

### How to Use
The hotkey combination for converting years is ctrl+shift+y

This macro lets you convert years as you are typing. The macro accounts for three scenarios:
- typing in word processors
- typing in text fields
- typing in spreadsheets

####Typing in Spreadsheets
Spreadsheets are the most complex software environement for the macro to handle. As a result, indivdiual spreadhsheet programs and web apps have to be accounted for. The macro will work in:
- Excel
- Excel's web app in Office365 
- Google Sheets

IF you use other spreadsheet software, the macro may not work correctly. PLease feel free to email me if you use something not listed above and would like me to try and make the macro compatible with it.


### Western Years to Nengō
Type any 4 digit year from 1868 onward and then press ctrl+shift+y. The macro will highlight the text and paste the nengō over it. For example 1936 will be pasted over as: "Shōwa 11". This should work in most any word processing program/web app. With spreadsheets

#### Things to know:
- Trying to convert a year before 1868 will produce an error.
- The macro will NOT convert Western years that fall on a year when the imperial era changes.
  - e.g.: 1868, 1912, 1926, 1989, 2019
  - This is because the last and first year of two succeeding imperial eras can happen in the same Western year.
  - An alert message will appear explaining the exact dates one era ends and the other begins.
- 2020 thorugh 2030 will be converted to Reiwa era nengō. No conversion or error message will appear for years higher than 2030.

### Nengō to Western Years
Type the first letter of the name of an imperial era, then the two digit year ***(no space)***, and then press ctrl+shit+y. For example, "s20" will be converted to "1945", "h12" will be converted to "2000", and so on.
- m = Meiji
- t = Taishō
- s = Shōwa
- h = Heisi
- r = Reiwa

#### Things to know:
- Trying to convert a year past the end of an imperial era will produce an error message explaining the last year of the era you tried to convert.
- For any year past the current Reiwa nengō, i.e, r53, the year will still be converted into a Western year.

# Known Issues

## Issues in Spreadsheet software/web apps.
Currently, the year conversion macro has been tested in Excel, Office 365 Excel, and Google Sheets.

# Future Changes/Features/Ideas (in no particular order)
- Improve compatibility with spreadsheet software/web apps.
- Impliment a GUI.
- Option to paste years in [] to assist library catalogers.
- Option to paste  years in Japanese, i.e., "昭和30" instead of "Shōwa 30"
- Ability to detect and copy phrases like "taisho 4" "taishō 4" "大正4" and "大正四
- The ability to cyle between o, ō, and ŏ; u, ū, and ŭ; instead of using seperate hot keys.
- Eliminate specific hot keys for each letter. Instead, type any one letter that can potentially have a diacritic and have one hotkey that looks at the last character typed and adds the appropriate diacritic. 
  - Would pair extremely well with the above idea for cycling letters with one diacritic.
  - Would also apply to currency symbols.
- Convert Western Years ⇄ nengō **before** before 1868
  - Labor intensive because of so many imperial eras.
  - Would require the use of YYYYMMDD date format to account for nengō changing during a Western year.
