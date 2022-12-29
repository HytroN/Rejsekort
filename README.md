# Hvordan man installere flutter, dart og emulator fra Visual Studio

## Systemkrav

For at installere og køre Flutter skal dit udviklingsmiljø opfylde disse mindstekrav:

- Operativsystem: Windows 7 SP1 eller højere (64-bit)
- Diskplads: 400 MB
- Værktøjer: Flutter afhænger af, at disse værktøjer er tilgængelige i dit miljø.
  - Windows PowerShell 5.0 eller nyere (Dette er allerede installeret med Windows 10)
  - 2.x med indstillingen Brug Git fra Windows Command Prompt.

> Hvis Git for Windows allerede er installeret, skal du sørge for at køre git-kommandoer fra kommandoprompten eller PowerShell.

## Download Flutter

1. Download følgende installationspakke for at få den seneste stabile udgivelse af Flutter SDK: [Download Flutter](https://storage.googleapis.com/flutter_infra/releases/stable/windows/flutter_windows_1.17.1-stable.zip)
2. Download zip-filen, og anbring folderen i den ønskede installationsplacering for Flutter SDK (for eksempel C:\src\flutter; (Dog skal du ikke installer Flutter i et bibliotek som C:\Program Files\ da det kræver forhøjede privilegier).

> Du er nu klar til at køre Flutter-kommandoer i Command Prompt!

### Kør Flutter Doctor

Kør følgende kommando

## Download Android Studio

1. Download og installere [Android Studio](https://developer.android.com/studio)

2. Start Android Studio, og gå gennem 'Android Studio opsætningsguiden'. Dette installerer de nyeste Android SDK, Android SDK Kommandolinjeværktøjer og Android SDK Build-Tools, som Flutter kræver, når man udvikler til Android.

## Klargør Android Emulator

Følg disse trin for at forberede dig til at køre og teste din Flutter-app på Android-emulatoren:

1. Aktiver [VM acceleration](https://developer.android.com/studio/run/emulator-acceleration) på din maskine
2. Start Android Studio > Tools > Android > AVD Manager og vælg Create Virtual Device. (Android-undermenuen er kun til stede, når du er inde i et Android-projekt.)
3. Vælg en enhedsdefinition, og tryk næste.
4. Vælg et eller flere systembilleder til de Android-versioner, du vil emulere, og vælg Næste. Et x86 eller x86_64 billede anbefales.
5. Under Emulated Performance skal du vælge Hardware - GLES 2.0 for at aktivere [hardware acceleration](https://developer.android.com/studio/run/emulator-acceleration).
6. Kontroller, at AVD-konfigurationen er korrekt, og tryk Udfør.
   - For detaljer om ovenstående trin, se [Managing AVDs](https://developer.android.com/studio/run/managing-avds)
7. I Android Virtual Device Manager skal du klikke på Run på værktøjslinjen. Emulatoren starter og viser standard lærred til din valgte OS-version og enhed.

### Flutter Document

1. Hvis du skulle være tvivl eller det ikke fungere kan du følge denne guide; [Flutter Document](https://flutter.dev/docs/get-started/install/windows)

2. Hvis det stadig ikke lykkedes dig at få det kørt, vil det være muligt at få hjælp fra YouTube :)
   - [How to Install and Setup Flutter for App Development on Windows - Part 1](https://www.youtube.com/watch?v=Z2ugnpCQuyw)
   - [How to Install and Setup Flutter for App Development on Windows - Part 2](https://www.youtube.com/watch?v=8YlJ9RjdpkA)
   - [How to Install and Setup Flutter for App Development on Windows - Part 3](https://www.youtube.com/watch?v=n9qDNVoe5V8)
