#!/bin/sh

# notification daemon using tiramisu and herbe

pkill tiramisu

NL='
'

format="$(printf '#summary\n\n#body\n')"

tiramisu -o "$format" | while IFS= read -r line || [ -n "$line" ]; do
    if [ "$line" = "" ]; then
        herbe "$var" && pkill herbe &
        unset var
    else
        [ "$var" = "" ] && var="${line}" || var="${var}${NL}${line}"
    fi
done
