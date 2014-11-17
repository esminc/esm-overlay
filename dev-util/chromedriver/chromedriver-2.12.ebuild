# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker

DESCRIPTION="WebDriver for Chrome"
HOMEPAGE="https://sites.google.com/a/chromium.org/chromedriver"
SRC_URI="http://chromedriver.storage.googleapis.com/${PV}/${PN}_linux64.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="|| ( www-client/google-chrome www-client/google-chrome-beta www-client/google-chrome-unstable )"

S=${WORKDIR}

src_unpack() {
	unpack_zip ${PN}_linux64.zip
}

src_install() {
	dobin ${PN}
}
