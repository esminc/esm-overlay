# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils pax-utils

DESCRIPTION="Headless WebKit with JavaScript API"
HOMEPAGE="http://www.phantomjs.org/"
SRC_BASE="http://phantomjs.googlecode.com/files/phantomjs-${PV}-linux-"
SRC_URI="amd64? ( ${SRC_BASE}x86_64.tar.bz2 ) x86? ( ${SRC_BASE}x86_64.tar.bz2 )"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="examples doc"
RESTRICT="strip"

DEPEND="
	app-arch/tar
	app-arch/bzip2
"
RDEPEND="!www-client/phantomjs"

S="${WORKDIR}/${A/.tar.bz2/}"

src_unpack() {
	unpack "${A}" || die
	cd "${S}" || die
}

src_install() {
	pax-mark m bin/phantomjs || die
	dobin bin/phantomjs || die

	if use doc; then
		dodoc ChangeLog LICENSE.BSD README.md third-party.txt || die
	fi

	if use examples; then
		docinto examples
		dodoc examples/* || die
	fi
}
