#!/bin/bash

ROOT_PARTITION='nvme1n1p2'
ROOT_UUID=$(sudo lsblk /dev/$ROOT_PARTITION -o UUID | sed '2!d')

echo "The UUID is $ROOT_UUID"


new-text
