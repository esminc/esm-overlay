# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION=""
HOMEPAGE="https://github.com/esminc/kclean"
SRC_URI="https://github.com/esminc/kclean/tarball/v${PV} -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* ${S}
}

src_install() {
	dosbin kclean
}
