#!/bin/bash

# Diese Variable enthält die RewriteRule
rule="RewriteRule ^(.*)\.webf$ $1.html [L]"

# Pfad zur mod_rewrite.conf
conf_file="/etc/apache2/mods-available/mod_rewrite.conf"

# Prüfen, ob die Datei existiert
if [ ! -f "$conf_file" ]; then
  echo "Datei $conf_file existiert nicht!"
  exit 1
fi

# Prüfen, ob die Regel bereits vorhanden ist
if grep -q "$rule" "$conf_file"; then
  echo "Regel bereits in $conf_file vorhanden!"
  exit 0
fi

# Regel am Ende der Datei hinzufügen
echo "$rule" >> "$conf_file"

echo "Regel erfolgreich zu $conf_file hinzugefügt!"

# Apache neu starten
sudo service apache2 restart
