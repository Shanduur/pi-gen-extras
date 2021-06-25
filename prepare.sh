#!/bin/bash

HERE=$(pwd)

sed -i 's/4MiB,250MiB,c,*/4MiB,256MiB,c,*/g'    pi-gen/common/qcow2_handling
sed -i 's/260MiB,,83;/260MiB,,83/g'             pi-gen/common/qcow2_handling

ln -s $HERE/stage2-trim               $HERE/pi-gen/stage2-trim 
ln -s $HERE/stage3-containerization   $HERE/pi-gen/stage3-containerization 
ln -s $HERE/stage3-virtualization     $HERE/pi-gen/stage3-virtualization 
ln -s $HERE/stage3.5-orchestration    $HERE/pi-gen/stage3.5-orchestration 
ln -s $HERE/config                    $HERE/pi-gen/config
