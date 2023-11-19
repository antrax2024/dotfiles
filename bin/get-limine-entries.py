#!/usr/bin/python
import glob

kernels = glob.glob('/boot/vmlinuz*')
for k in kernels:
    kernelLine = k.replace('/boot/vmlinuz-', '')
    print(':{}'.format(kernelLine))
    print('\tPROTOCOL=linux')
    print('\tKERNEL_PATH=uuid://${}/boot/vmlinuz-{}'.format('ROOT_UUID',kernelLine))
    print('\tCMDLINE=root=UUID=${ROOT_UUID} rw ${KERNEL_PARAMS}')
    print('\tMODULE_PATH=uuid://${}/boot/initramfs-{}.img'.format('ROOT_UUID',kernelLine))







