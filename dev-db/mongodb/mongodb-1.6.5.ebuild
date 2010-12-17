# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/mongodb/mongodb-1.5.5.ebuild,v 1.1 2010/07/18 12:58:58 lu_zero Exp $

EAPI="2"

inherit eutils versionator

MY_PATCHVER=$(get_version_component_range 1-2)
MY_P="${PN}-src-r${PV}"

DESCRIPTION="A high-performance, open source, schema-free document-oriented database"
HOMEPAGE="http://www.mongodb.org"
SRC_URI="http://downloads.mongodb.org/src/${MY_P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="v8"

RDEPEND="dev-libs/boost
	dev-libs/libpcre
	v8? ( dev-lang/v8 )
	!v8? ( dev-lang/spidermonkey[unicode] )"

DEPEND="${RDEPEND}
	>=dev-util/scons-1.2.0-r1
	sys-libs/readline
	sys-libs/ncurses"

# Must change this on every upgrade
S="${WORKDIR}/${MY_P}"

use_v8() {
	use v8 && echo "--usev8"
}

pkg_setup() {
	enewgroup mongodb
	enewuser mongodb -1 -1 /var/lib/${PN} mongodb
}

src_prepare() {
	epatch "${FILESDIR}/${PN}-${MY_PATCHVER}.0-fix-scons.patch"
}

src_compile() {
	scons ${MAKEOPTS} all $(use_v8) || die "Compile failed"
}

src_install() {
	scons ${MAKEOPTS} --nostrip install --prefix="${D}"/usr $(use_v8) || die "Install failed"

	for x in /var/{lib,log,run}/${PN}; do
		dodir "${x}" || die "Install failed"
		fowners mongodb:mongodb "${x}"
	done

	doman debian/mongo*.1 || die "Install failed"
	dodoc README docs/building.md

	newinitd "${FILESDIR}/${PN}.initd" ${PN} || die "Install failed"
	newconfd "${FILESDIR}/${PN}.confd" ${PN} || die "Install failed"
}

src_test() {
	scons ${MAKEOPTS} smoke --smokedbprefix='testdir' test || die "Tests failed"
}
