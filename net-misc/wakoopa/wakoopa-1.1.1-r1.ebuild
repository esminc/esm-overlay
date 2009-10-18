# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils

DESCRIPTION="Wakoopa is a social network that helps people discover the best software, games and web apps on the market."
HOMEPAGE="http://wakoopa.com/"
SRC_URI="x86? ( http://apt.wakoopa.com/wakoopa_${PV}_i686.tar.gz )
	amd64? ( http://apt.wakoopa.com/wakoopa_${PV}_x86_64.tar.gz )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	x11-libs/gtk+
	x11-libs/libXinerama
	x11-libs/libXScrnSaver
"
DEPEND="${RDEPEND}"

S=${WORKDIR}

QA_PRESTRIPPED="opt/wakoopa/wakoopa"

src_install() {
	declare WAKOOPA_HOME=/opt/wakoopa

	dodir ${WAKOOPA_HOME}
	cp -r ${A%.tar.gz}/* ${D}${WAKOOPA_HOME} || die

	make_wrapper wakoopa ./wakoopa ${WAKOOPA_HOME}
}
