#!/bin/bash


# Call the user setup script.
user_cfg_script=$(find . -name 'set-user-config.sh')
lo_cfg=$(find . -name 'registrymodifications.xcu')
"${user_cfg_script}" -l "${lo_cfg}"

# Call the system setup script.
sys_cfg_script=$(find . -name 'set-system-config.sh')
tb_cfg=$(find . -name 'SIL-CAR-cfg.js')
sudo "${sys_cfg_script}" -t "${tb_cfg}"

# Copy user config to /etc/skel.
sudo wasta-remastersys-skelcopy $USER

exit 0
