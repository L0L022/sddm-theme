Papyros SDDM Theme
==================

The [SDDM](https://github.com/sddm/sddm) login screen theme for [Papyros](http://papyros.io) following Material Design.

### Add translations ###

Generate the TS file where xx - language code, YY - country code:

    $ lupdate Main.qml UserDelegate.qml IndicatorRow.qml -ts xx_YY.ts

Translate it and generate the QM file:

    $ lrelease xx_YY.ts

And put it in the translations directory
