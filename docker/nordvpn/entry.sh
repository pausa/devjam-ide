#!/usr/bin/env fish
mkdir /run/nordvpn
nordvpnd > /dev/null &

while not test -e /run/nordvpn/nordvpnd.sock
    echo "waiting for sock"
    sleep 1
end

echo "logging in"
nordvpn login --username "$NORD_USER"  --password "$NORD_PWD"
echo "connecting"
nordvpn connect $argv

wait
