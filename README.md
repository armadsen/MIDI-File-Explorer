# MIDI-File-Explorer
Utility for showing events in a MIDI file

This is a super quick Mac utility I wrote to inspect the events in a MIDI file. It uses MIKMIDI, installed via [Carthage](https://github.com/Carthage/Carthage). It is very rough, as it was just a quick tool written to help me solve a problem in another app I was working on. However, it does demonstrate how simple it is to open a MIDI file and show its events using MIKMIDI.  The entire appliction is implemented in `ORSMainViewController` and Main.storyboard.

# Building

- Clone the project
- Run [carthage](https://github.com/Carthage/Carthage): `carthage bootstrap --platform macOS`
- Open the Xcode project and build.
