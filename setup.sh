#!/bin/bash

systemctl stop languagetool

# Remove the previous directory
rm -r $(ls -l | grep -e '^d' | awk '{print $NF}')

# Remove the previously existing version of LT
rm LanguageTool-stable.zip

# Get the latest version
wget https://languagetool.org/download/LanguageTool-stable.zip

# Extract it
unzip LanguageTool-stable.zip

# Get the new dir name
DIRNAME=$(ls -l | grep -e '^d' | awk '{print $NF}')
ln -sf $DIRNAME LanguageTool

systemctl start languagetool
