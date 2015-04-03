# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit unpacker systemd

DESCRIPTION="Drone is a Continuous Integration platform built on Docker, written in Go"
HOMEPAGE="https://github.com/drone/drone"

if [ "${PV}" != "9999" ];then
	SRC_URI="http://downloads.drone.io/${PV}/${PN}.deb -> ${P}.deb"
else
	SRC_URI="http://downloads.drone.io/master/${PN}.deb -> ${P}.deb"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

RESTRICT="strip"

S=$WORKDIR

src_install() {
	dobin usr/local/bin/drone
	dosbin usr/local/bin/droned

	doins -r etc

	dodir /var/lib/"${PN}"

	newinitd "${FILESDIR}"/droned-${PV}.init droned

	insinto "$(systemd_get_unitdir)"
	newins "${FILESDIR}"/droned-${PV}.service droned.service
}
