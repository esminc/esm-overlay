# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Launchy, keystroke program launcher"
HOMEPAGE="http://www.launchy.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="calcy"

DEPEND="calcy? ( dev-libs/boost )
		x11-libs/qt-core "
RDEPEND=""

RESTRICT="primaryuri"

src_prepare() {
	epatch "${FILESDIR}/launchy-qmake.patch"
	if ! use calcy ; then
		epatch "${FILESDIR}/launchy-nocalcy.patch"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"

	dodoc readme.txt
}

pkg_postinst() {
	if ! use calcy ; then
		elog "Launchy has been built without the calcy plugin."
		elog "If you want to use calcy set the 'calcy' USE flag"
		elog "and rebuild Launchy."
	fi
}
