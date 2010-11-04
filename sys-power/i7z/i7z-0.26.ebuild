# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

ETYPE="sys-power"

DESCRIPTION="A better i7 (and now i3, i5) reporting tool for Linux."
HOMEPAGE="http://code.google.com/p/i7z/"
IUSE="ncurses"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64"

SRC_URI="http://i7z.googlecode.com/files/${P}.tar.gz"

DEPEND=">=sys-libs/ncurses-5.2"

#pkg_setup() {
#	einfo "pkg_setup"
#}

#src_unpack() {
#	einfo "src_unpack"
#}


src_install() {
	dobin i7z
}
