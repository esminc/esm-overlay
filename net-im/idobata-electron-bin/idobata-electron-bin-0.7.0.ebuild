# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MY_PN="${PN/-bin/}"

inherit eutils gnome2-utils unpacker

DESCRIPTION="Unofficial Idobata client built on Electron"
HOMEPAGE="https://github.com/hrysd/idobata-electron"
SRC_URI="https://github.com/hrysd/idobata-electron/releases/download/v${PV}/${MY_PN}_${PV}_amd64.deb"

LICENSE="no-source-code"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="gnome-base/gconf:2
	dev-libs/libappindicator
	x11-libs/libXtst:0
	dev-libs/nss:0
"

QA_PREBUILT="opt/idobata-electron/idobata-electron
	opt/idobata-electron/idobata-electron
	opt/idobata-electron/libffmpeg.so
	opt/idobata-electron/libnode.so
"

S="${WORKDIR}"

src_install() {
	insinto /usr/share/icons
	doins usr/share/icons/hicolor/256x256/apps/${MY_PN}.png
	domenu usr/share/applications/${MY_PN}.desktop

	insinto /opt/${MY_PN}
	doins -r opt/${MY_PN}/.
	fperms +x /opt/${MY_PN}/${MY_PN}
	dosym /opt/${MY_PN}/${MY_PN} /usr/bin/${MY_PN}
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
