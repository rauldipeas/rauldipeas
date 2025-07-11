#!/bin/bash
set -e
sudo mkdir -p /usr/local/share/custom-launchers
cat <<EOF |sudo tee /usr/local/bin/custom-launchers>/dev/null
for script in /usr/local/share/custom-launchers/*; do
  [ -f "\$script" ] && bash "\$script"
done
EOF
sudo touch /usr/local/share/custom-launchers/placeholder
sudo chmod +x /usr/local/bin/custom-launchers
cat <<EOF |sudo tee /etc/apt/apt.conf.d/99-custom-launchers>/dev/null
DPkg::Post-Invoke {
    "/usr/local/bin/custom-launchers";
};
EOF