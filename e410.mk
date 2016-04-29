$(call inherit-product, device/lge/msm7x27a-common/msm7x27a-common.mk)

$(call inherit-product-if-exists, vendor/lge/e410/e410-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/e410/overlay

$(call inherit-product, $(LOCAL_PATH)/mdpi-dalvik.mk)

PRODUCT_AAPT_CONFIG := normal mdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.v1.rc:root/init.v1.rc \
    $(LOCAL_PATH)/ueventd.v1.rc:root/ueventd.v1.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/v1_keypad.kl:system/usr/keylayout/v1_keypad.kl \

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/librasdioif.ko:system/lib/modules/librasdioif.ko \
    $(LOCAL_PATH)/prebuilt/wlan.ko:system/lib/modules/wlan.ko

# HW HALS
PRODUCT_PACKAGES += \
    gps.e410 \
    power.e410

PRODUCT_NAME := full_e410
PRODUCT_DEVICE := e410
PRODUCT_MODEL := LG-E410
