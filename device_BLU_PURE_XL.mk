$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/BLU/BLU_PURE_XL/BLU_PURE_XL-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/BLU/BLU_PURE_XL/overlay

LOCAL_PATH := device/BLU/BLU_PURE_XL

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/BLU/BLU_PURE_XL/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
	libxlog 

#Wifi
PRODUCT_PACKAGES += \
	libwifi-hal-mt66xx \
	lib_driver_cmd_mt66xx \
	libwpa_client \
	hostapd \
	hostapd_cli \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf

#Audio
PRODUCT_PACKAGES += \
    	audio_policy.default \
    	audio_policy.stub \
    	audio.r_submix.default \
    	audio.usb.default \
    	libaudio-resampler \
    	tinymix \
    	libtinyalsa

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/permissions/media_codecs.xml \
	$(LOCAL_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf


#Bluetooth
PRODUCT_PACKAGES += \
    	libbt-vendor
	
#Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/enableswap.sh:root/enableswap.sh \
	$(LOCAL_PATH)/ramdisk/factory_init.project.rc:root/factory_init.project.rc \
	$(LOCAL_PATH)/ramdisk/factory_init.rc:root/factory_init.rc \
	$(LOCAL_PATH)/ramdisk/fstab.mt6795:root/fstab.mt6795 \
	$(LOCAL_PATH)/ramdisk/init.aee.rc:root/init.aee.rc \
	$(LOCAL_PATH)/ramdisk/init.environ.rc:root/environ.rc \
	$(LOCAL_PATH)/ramdisk/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/ramdisk/init.mt6795.rc:root/init.mt6795.rc \
	$(LOCAL_PATH)/ramdisk/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/ramdisk/init.ssd.rc:root/init.ssd.rc \
	$(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
	$(LOCAL_PATH)/ramdisk/init.trustonic.rc:root/init.trustonic.rc \
	$(LOCAL_PATH)/ramdisk/init.xlog.rc:root/init.xlog.rc \
	$(LOCAL_PATH)/ramdisk/meta_init.modem.rc:root/meta_init.modem.rc \
	$(LOCAL_PATH)/ramdisk/meta_init.project.rc:root/meta_init.project.rc \
	$(LOCAL_PATH)/ramdisk/meta_init.rc:root/meta_init.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.mt6795.rc:root/ueventd.mt6795.rc

#Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.app_widgets.xml:/system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml 

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    	ro.kernel.android.checkjni=0 \
    	dalvik.vm.checkjni=false \
	ro.telephony.ril_class=MediaTekRIL \
	ro.telephony.ril.config=fakeiccid

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_BLU_PURE_XL
PRODUCT_DEVICE := BLU_PURE_XL

#Set correct memory limits
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
