# Macrons & Nengō
A set of simple macros to quickly type romanized Japanese vowels with macrons (ex: ō) and Korean vowels with breves (ex: ŭ). It also allows for quick "on the fly" conversion of Western years to [Japanese imperial era years (nengō/年号)](https://en.wikipedia.org/wiki/Japanese_era_name#Neng%C5%8D_in_modern_Japan) and vice versa. These macros were created in [AutoHotKey (AHK)](https://www.autohotkey.com/) and are contatined in a self executing file that launches a tiny stand alone program in the background.

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

### Western Years to Nengō
Type any 4 digit year from 1868 onward and then press ctrl+shift+y. The macro will highlight the text and paste the nengō over it.

The macro will not run when:
- A year before 1868 is typed.

### Nengō to Western Years

# Known Issues

# Future Changes/Features
