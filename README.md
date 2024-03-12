# .webf Installation Apache2 Webserver

**Sichern Sie die Originaldatei:**

Erstellen Sie eine Kopie der Originaldatei (/etc/apache2/mods-available/mod_rewrite.conf), bevor Sie Änderungen vornehmen.

**Suchen Sie die RewriteCond-Anweisung:**

****Suchen Sie nach der folgenden Zeile:****

RewriteCond %{REQUEST_FILENAME} !-f

**Fügen Sie eine neue RewriteRule-Anweisung hinzu:**

****Fügen Sie direkt unter der RewriteCond-Anweisung die folgende Zeile hinzu:****

RewriteRule ^(.*)\.webf$ $1.html [L]

**Erklärung:**

Diese RewriteRule-Anweisung leitet alle URLs mit der Endung .webf auf die entsprechende Datei mit der Endung .html um.
[L] beendet die Verarbeitung weiterer Rewrite-Regeln für die aktuelle Anfrage.
