#!/bin/bash -e

CURRENT_PATH=$(pwd)
cd "${ROOTFS_DIR}/tmp" && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
install -m 755 kubectl "${ROOTFS_DIR}/bin/" 
cd "$CURRENT_PATH" 
