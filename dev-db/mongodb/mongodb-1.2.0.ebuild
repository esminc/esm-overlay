# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="A high-performance, open source, schema-free document-oriented database"
HOMEPAGE="http://www.mongodb.org"
SRC_URI="http://github.com/mongodb/mongo/tarball/r${PV} -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/spidermonkey
	dev-libs/boost
	dev-libs/libpcre"

DEPEND="${RDEPEND}
	>=dev-util/scons-1.2.0-r1
	test? ( dev-libs/unittest )"

S=${WORKDIR}/${PN}-mongo-2add01f

pkg_setup() {
	enewgroup mongodb
	enewuser mongodb -1 -1 /var/lib/${PN} mongodb
}

src_prepare() {
	epatch "${FILESDIR}"/modify-*.patch
}

src_compile() {
	scons ${MAKEOPTS} all || die "Compile failed"
}

src_install() {
	scons ${MAKEOPTS} install --prefix="${D}"/usr || die "Install failed"

	for x in /var/{lib,log,run}/${PN}; do
		dodir "${x}" || die "Install failed"
		fowners mongodb:mongodb "${x}"
	done

	doman debian/mongo*.1 || die "Install failed"

	newinitd "${FILESDIR}/${PN}.initd" ${PN} || die "Install failed"
	newconfd "${FILESDIR}/${PN}.confd" ${PN} || die "Install failed"
}

src_test() {
	scons ${MAKEOPTS} smoke test || die "Tests failed"
}
