include device/lge/msm7x27a-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/lge/e410/BoardConfigVendor.mk
TARGET_BOOTLOADER_BOARD_NAME := e410

BOARD_KERNEL_CMDLINE := androidboot.hardware=v1 lge.signed_image=false

TARGET_KERNEL_CONFIG := cyanogenmod_v1_defconfig
TARGET_PREBUILT_KERNEL := device/lge/e410/kernel

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := e410

BOARD_CUSTOM_GRAPHICS := ../../../device/lge/e410/recovery/graphics.c
