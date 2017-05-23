#include <stdlib.h>
#include <stdio.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties() {
    char gversionbb[92];
    char dversionbb[92];
    char o_gversionbb[92];
    char o_dversionbb[92];
    FILE *fp;

    fp = popen("/system/xbin/printf $(/system/xbin/strings /dev/block/mmcblk0p12 | /system/bin/grep -e '-V10' -e '-V20')", "r");
    fgets(gversionbb, sizeof(gversionbb), fp);
    pclose(fp);
    property_set("gsm.version.baseband", gversionbb);

    fp = popen("/system/xbin/printf $(/system/bin/getprop gsm.version.baseband | /system/bin/grep -o -e 'E410' -e 'E411' -e 'E415' -e 'E420')", "r");
    fgets(dversionbb, sizeof(dversionbb), fp);
    pclose(fp);
    property_set("ro.product.device", dversionbb);
    property_set("ro.product.model", dversionbb);

    if (strstr(dversionbb, "E415") || strstr(dversionbb, "E420")) {
        property_set("persist.radio.multisim.config", "dsds");
        property_set("persist.multisim.config", "dsds");
        property_set("ro.multi.rild", "true");
    };

    if (strlen(gversionbb) == 0) {
        property_set("gsm.version.baseband", "V10");
        property_set("ro.product.device", "v1");
        property_set("ro.product.model", "v1");
    };

    property_get("gsm.version.baseband", o_gversionbb);
    property_get("ro.product.device", o_dversionbb);

    ERROR("Found %s gsm baseband setting build properties for %s device\n", o_gversionbb, o_dversionbb);
}