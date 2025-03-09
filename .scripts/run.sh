#!/bin/bash

# A script to run repository converter and creates formatted gherkin features files.
#
# Usage example:
# > sh run.sh sources/excel/repository.xlsx

echo "[🚀] ... running Documents repository origin xls converter.."
sh xlsjsonconverter.sh $1 > sources/temp/repository.json
echo "[✅] ... completed Documents repository origin xls converter.."

echo "[🚀] ... running Documents repository converter.."
./cli/DigitalDocsCLI -i 'sources/temp/repository.json' -o '../Sources/InoxDemat/Resources/Repository/Documents.json' -f '../Tests/InoxDematTests/Resources/Features/'

echo "[🚀] ... running Documents repository formatter.."
sh gherkins/gherkinformatter.sh

echo "[🚀] ... clean Documents files.."
sh docscleaner.sh
echo "[✅] ... Documents repository converter completed successfully! 🍾 🔥 💾 😁"

#echo "[🚀] ... run swift test"
#cd "../"
#xcodebuild -quiet -scheme InoxDemat test -destination "platform=iOS Simulator,name=iPad Pro 11-inch (M4),OS=latest"
#cd ".scripts/"

