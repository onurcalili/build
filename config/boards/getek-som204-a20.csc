# A20 dual core 1Gb SoC dual ethernet
BOARD_NAME="GETEK-SOM204"
BOARDFAMILY="sun7i"
BOOTCONFIG="GETEK-SOM204-A20_defconfig"
MODULES_LEGACY="tpm_tis_spi"
MODULES_CURRENT="tpm_tis_spi"
MODULES_DEV="tpm_tis_spi"
SERIALCON="ttyS0"
KERNEL_TARGET="legacy,current,dev"
BOOTDELAY=0
# KERNEL_USE_GCC='< 8.0'
# UBOOT_USE_GCC='< 8.0'
