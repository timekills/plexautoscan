#!/bin/bash
function sudocheck () {
  if [[ $EUID -ne 0 ]]; then
    tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  You Must Execute as a SUDO USER (with sudo) or as ROOT!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
    exit 0
  fi
}

function clone() {
    sudo rm -rf /opt/plexguide/menu/pgscan
    sudo git clone --quiet https://github.com/doob187/plexautoscan.git /opt/plexguide/menu/pgscan
    sudo chown -cR 1000:1000 /opt/plexguide/menu/
    sudo chmod -cR 755 /opt/plexguide/menu/
    sudo bash /opt/plexguide/menu/pgscan/pgscan.sh
}
sudocheck
clone
