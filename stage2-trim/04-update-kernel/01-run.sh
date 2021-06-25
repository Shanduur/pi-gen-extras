#!/bin/bash -e

sed -i 's/read -p/# read -p/g' 		files/rpi-update

install -v -m 755 files/rpi-update 	"${ROOTFS_DIR}/usr/bin/"

# updates kernel and then runs it once again to 
on_chroot <<EOF
UPDATE_SELF=0 REPLY=y /usr/bin/rpi-update
/usr/bin/rpi-update
EOF

# set kernel option to 64 bit 
function set_kernel_64() {
    local FLAG_EXISTS=0
    local FLAG_NONZERO=0

    [[ $(cat ${ROOTFS_DIR}/boot/config.txt | grep "arm_64bit") ]] && FLAG_EXISTS=1
    [[ $(cat ${ROOTFS_DIR}/boot/config.txt | grep "arm_64bit=1") ]] && FLAG_NONZERO=1

    if [[ $FLAG_EXISTS -eq 1 ]]
    then 
        if [[ $FLAG_NONZERO -eq 1 ]]
        then
            if [[ $(cat ${ROOTFS_DIR}/boot/config.txt | grep "# arm_64bit=1") ]]
            then
                sed -i 's/# arm_64bit=1/arm_64bit=1/g' ${ROOTFS_DIR}/boot/config.txt
            elif [[ $(cat ${ROOTFS_DIR}/boot/config.txt | grep "#arm_64bit=1") ]]
            then
                sed -i 's/#arm_64bit=1/arm_64bit=1/g' ${ROOTFS_DIR}/boot/config.txt
            fi
        else
            if [[ $(cat ${ROOTFS_DIR}/boot/config.txt | grep "# arm_64bit=0") ]]
            then
                sed -i 's/# arm_64bit=0/arm_64bit=1/g' ${ROOTFS_DIR}/boot/config.txt
            elif [[ $(cat ${ROOTFS_DIR}/boot/config.txt | grep "#arm_64bit=0") ]]
            then
                sed -i 's/#arm_64bit=0/arm_64bit=1/g' ${ROOTFS_DIR}/boot/config.txt
            else
                sed -i 's/arm_64bit=0/arm_64bit=1/g' ${ROOTFS_DIR}/boot/config.txt
            fi
        fi
    else
        echo "arm_64bit=1" >> ${ROOTFS_DIR}/boot/config.txt
    fi
}

set_kernel_64
