#!/bin/bash

# This variable contains the RewriteRule
rule="RewriteRule ^(.*)\.webf$ $1.html [L]"

# Path to mod_rewrite.conf
conf_file="/etc/apache2/mods-available/mod_rewrite.conf"

# Check if the file exists
if [ ! -f "$conf_file" ]; then
  echo "File $conf_file does not exist!"
  exit 1
fi

# Check if the rule already exists
if grep -q "$rule" "$conf_file"; then
  echo "Rule already present in $conf_file!"
  exit 0
fi

# Append the rule to the end of the file
echo "$rule" >> "$conf_file"

echo "Rule successfully added to $conf_file!"

# Restart Apache
sudo service apache2 restart
