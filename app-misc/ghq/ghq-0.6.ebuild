# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Manage remote repository clones"
HOMEPAGE="https://github.com/motemen/ghq"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/ghq_linux_amd64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="zsh-completion"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${A%.tar.gz}"

src_install() {
	dobin ghq
	dodoc README.asciidoc

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins zsh/*
	fi
}
