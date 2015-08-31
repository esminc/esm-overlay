# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="z is the new j, yo"
HOMEPAGE="https://github.com/rupa/z"
SRC_URI="https://github.com/rupa/z/archive/v${PV}.tar.gz"

LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	insinto /usr/share/z
	doins ${PN}.sh
	doman ${PN}.1
}

pkg_postinst() {
	elog 'Put something like this in your $HOME/.bashrc or $HOME/.zshrc:'
	elog
	elog '    . /usr/share/z/z.sh'
	elog
	elog 'cd around for a while to build up the db.'
}
