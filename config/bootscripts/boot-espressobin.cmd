# DO NOT EDIT THIS FILE
#
# Please edit /boot/armbianEnv.txt to set supported parameters
#

# default values
setenv rootdev "/dev/mmcblk0p1"
setenv verbosity "1"
setenv rootfstype "ext4"
setenv fdt_name_a dtb/marvell/armada-3720-community.dtb
setenv fdt_name_b dtb/marvell/armada-3720-espressobin.dtb

# additional values
setenv ethaddr "F0:AD:4E:03:64:7F"

load ${boot_interface} ${devnum}:1 ${scriptaddr} ${prefix}armbianEnv.txt
env import -t ${scriptaddr} ${filesize}

setenv bootargs "$console root=${rootdev} rootfstype=${rootfstype} rootwait loglevel=${verbosity} usb-storage.quirks=${usbstoragequirks} mtdparts=spi0.0:1536k(uboot),64k(uboot-environment),-(reserved) ${extraargs}"

ext4load $boot_interface 0:1 $kernel_addr ${prefix}$image_name
ext4load $boot_interface 0:1 $initrd_addr ${prefix}$initrd_image
ext4load $boot_interface 0:1 $fdt_addr ${prefix}$fdt_name_a
ext4load $boot_interface 0:1 $fdt_addr ${prefix}$fdt_name_b

booti $kernel_addr $initrd_addr $fdt_addr
# mkimage -C none -A arm -T script -d /boot/boot.cmd /boot/boot.scr
