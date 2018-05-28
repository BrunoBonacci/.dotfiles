#!/bin/bash

export TS=`date +%Y%m%d_%H%M%S`
export BK=".emacs.d.${TS}"
echo "Creating backup: $BK"
sudo cp -a ~/.emacs.d/ ~/$BK
