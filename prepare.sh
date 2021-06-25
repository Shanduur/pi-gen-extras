#!/bin/bash

HERE=$(pwd)

sed -i 's/4MiB,250MiB/4MiB,256MiB/g'    ./pi-gen/scripts/qcow2_handling
sed -i 's/254MiB/260MiB/g'             ./pi-gen/scripts/qcow2_handling

ln -sf $HERE/stage2-trim               $HERE/pi-gen/stage2-trim 
ln -sf $HERE/stage3-containerization   $HERE/pi-gen/stage3-containerization 
ln -sf $HERE/stage4-virtualization     $HERE/pi-gen/stage4-virtualization 
ln -sf $HERE/stage5-orchestration    $HERE/pi-gen/stage5-orchestration 
ln -sf $HERE/config                    $HERE/pi-gen/config
