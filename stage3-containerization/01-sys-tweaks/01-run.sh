#!/bin/bash -e

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o ${ROOTFS_DIR}/usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee ${ROOTFS_DIR}/etc/apt/sources.list.d/docker.list > /dev/null