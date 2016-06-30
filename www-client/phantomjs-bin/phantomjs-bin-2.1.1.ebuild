# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils pax-utils

DESCRIPTION="Headless WebKit with JavaScript API"
HOMEPAGE="http://www.phantomjs.org/"
SRC_URI="https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PV}-linux-x86_64.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples doc"
RESTRICT="strip"

DEPEND="app-arch/tar
	app-arch/bzip2"
RDEPEND="!www-client/phantomjs"

S="${WORKDIR}/${A/.tar.bz2/}"

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
