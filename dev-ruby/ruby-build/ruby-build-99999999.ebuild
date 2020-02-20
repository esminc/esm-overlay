# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="https://github.com/rbenv/ruby-build.git"

inherit git-r3

DESCRIPTION="Compile and install Ruby"
HOMEPAGE="https://github.com/rbenv/ruby-build"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="+rbenv"

DEPEND=""

src_install() {
	dobin bin/ruby-build
	dobin bin/rbenv-uninstall

	insinto /usr/share
	doins -r share/ruby-build

	if use rbenv ; then
		exeinto /opt/rbenv/libexec
		doexe bin/rbenv-install
	fi

	dodoc README.md
}
