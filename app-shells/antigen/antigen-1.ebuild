# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A plugin manager for zsh, inspired by oh-my-zsh and vundle"
HOMEPAGE="https://github.com/zsh-users/antigen"
SRC_URI="https://github.com/zsh-users/antigen/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-shells/zsh"

src_compile() {
	:
}

src_install() {
	insinto /usr/share
	doins antigen.zsh
	dodoc README.mkd
}
