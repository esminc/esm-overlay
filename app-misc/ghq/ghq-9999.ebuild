# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-2

DESCRIPTION="Manage remote repository clones"
HOMEPAGE="https://github.com/motemen/ghq"
SRC_URI=""

EGIT_REPO_URI="git://github.com/motemen/ghq.git"
EGIT_BRANCH="master"
if [ "${PV}" != "9999" ];then
	EGIT_COMMIT="v${PV}"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="zsh-completion"

DEPEND="dev-lang/go"
RDEPEND=""

pkg_setup() {
	export GOPATH="${WORKDIR}/${P}"
}

src_install() {
	mv ${P} ${PN}
	dobin ${PN}

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins zsh/*
	fi

	dodoc ghq.txt
}
