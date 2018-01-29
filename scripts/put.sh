#!/bin/bash
P1=$1
P2=$2
echo "Putting"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        SEDFIX=
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        SEDFIX='""'
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        SEDFIX=
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        SEDFIX=
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
        SEDFIX=
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
        SEDFIX=
else
        # Unknown.
        SEDFIX=
fi
$(curl -sS  -X POST http://localhost:8089/write/${P1}/${P2} \
 -H "Content-Type: application/x-www-form-urlencoded" \
 )

