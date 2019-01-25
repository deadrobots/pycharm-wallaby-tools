#!/bin/bash

WD="/home/root/Documents/KISS/Default User/$2"
WDESC="/home/root/Documents/KISS/Default\\ User/$2"

ssh -oStrictHostKeyChecking=no root@$1 <<EOF
	rm -rf "$WD"
	mkdir "$WD"
	mkdir "$WD/bin"
	mkdir "$WD/src"
	mkdir "$WD/data"
	mkdir "$WD/include"
	echo '{"language":"Python","user":"Default User"}' > "$WD/project.manifest"
EOF

scp $3/* root@$1:"$WDESC/bin/"

ssh -oStrictHostKeyChecking=no root@$1 <<EOF
	ln -s "$WD/bin/main.py" "$WD/bin/botball_user_program"
	chmod +x "$WD/bin/main.py"
EOF

paplay /opt/PycharmTools/uploaded.wav &
