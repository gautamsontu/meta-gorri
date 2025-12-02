DESCRIPTION = "Mosquitto patch file for config"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Adding override file to the list of inputs the recipe uses. BitBake will copy it into ${WORKDIR} during the build.
SRC_URI += "file://mosquitto-override.conf"

# Enabling it (create the boot-time symlinks), so it starts on boot.
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

# Run after the original mosquitto do_install.
do_install:append(){
	install -d ${D}${systemd_system_unitdir}/mosquitto.service.d
	install -m 0644 ${WORKDIR}/mosquitto-override.conf ${D}${systemd_system_unitdir}/mosquitto.service.d/override.conf
}

# Making sure the override file is packaged
FILES:${PN} += " ${systemd_system_unitdir}/mosquitto.service.d/override.conf"
