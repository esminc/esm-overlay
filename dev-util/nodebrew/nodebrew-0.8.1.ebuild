# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit bash-completion-r1

DESCRIPTION="Node.js version manager"
HOMEPAGE="https://github.com/hokaccha/nodebrew"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="zsh-completion"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/perl"

src_install() {
	dobin nodebrew
	dodoc README.md History.md
	dobashcompletion completions/bash/nodebrew-completion ${PN}

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins completions/zsh/_nodebrew _${PN}
	fi
}
