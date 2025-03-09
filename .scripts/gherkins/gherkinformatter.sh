#!/bin/bash

# Usage example:
# > sh gerkinformatter.sh

SCRIPT_PATH=`pwd`

echo "[🚀] ... run gherkin formatter"

cd "$(dirname "../Tests/InoxDematTests/Resources/Features/")"

echo "[🚀] ... gherkin formatter diagnostics.."

for file in $(find .. -type f -name *.feature)
do
 echo "[🚀] ... processing.. ${file}"
  $SCRIPT_PATH/gherkins/ghokin fmt replace ${file}
 echo "[🚀] ... completed file formatting.."
done

echo "[✅] ... gherkin formatter process completed successfully!"
