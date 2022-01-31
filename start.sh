#!/usr/bin/env bash

socat TCP-LISTEN:25,fork TCP:127.0.0.1:1025 &
socat TCP-LISTEN:143,fork TCP:127.0.0.1:1143 &

FILE='/root/.config/start-up-done.txt'
if test -f "$FILE"; then
  echo 'gpg and pass already configured'
  exit
fi

printf "Key-Type: 1\nKey-Length: 2048\nSubkey-Type: 1\nSubkey-Length: 2048\nName-Real: Root\nName-Email: root@$(hostname)\nExpire-Date: 0\n%%no-protection\n" \
    > gen-key-config.tmp
gpg --batch --gen-key gen-key-config.tmp
rm ./*.tmp

pass init "root@$(hostname)"

touch "$FILE"
