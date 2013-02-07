# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="z is the new j, yo"
HOMEPAGE="https://github.com/rupa/z"
SRC_URI="https://github.com/rupa/z/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* ${S}
}

src_install() {
	dobin z.sh
	doman z.1
}

pkg_postinst() {
	elog 'Put something like this in your $HOME/.bashrc or $HOME/.zshrc:'
	elog
	elog '    . /path/to/z.sh'
	elog
	elog 'cd around for a while to build up the db.'
}
