## Zilo Andi Transliterator

This is an FST converter that converts modified Avar Cyrillic alphabet (used in Zilo Andi, zilo1238) to IPA and vice versa. It includes the following additions:

- <ӏ> (U+04CF, [Cyrillic small letter Palochka](https://en.wikipedia.org/wiki/Palochka)) and <Ӏ> (U+04C0, [Cyrillic letter Palochka](https://en.wikipedia.org/wiki/Palochka)) can be used interchangeably.  It's also possible to use <I> (U+0049, Latin Capital letter I) and <1> (U+0031, Digit One) for the same purpose.
- Nasalisation is absent in Avar, so to denote nasalisation in Zilo Andi Cyrillic, several options are possible: <ᴴ> (U+1D34, Modifier Letter Capital H, e.g., <аᴴ>), <2> (U+0031, Digit Two, e.g., <а2>), or a tilde over the vowel (e.g., <а̃>).
- We expect [je] following a vowel or in word-initial position to be spelled as <йе>, which contradicts Russian spelling.
- The sequence <лъ> is ambiguous. We decided to use <лъ> to denote a lateral fricative [ɬ] and <л.ъ> to denote a combination of [l] and [ʔ], so you need to preprocess your text before using the transliterator.

Please refer to the transliterator as follows:

```
Moroz G. (2026) An FST transliterator from Zilo Andi Cyrillic to IPA, https://github.com/LingConLab/zilo_andi_transliterator
```
