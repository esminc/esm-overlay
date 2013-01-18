# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/sstephenson/ruby-build.git"

inherit git

DESCRIPTION="Compile and install Ruby"
HOMEPAGE="https://github.com/sstephenson/ruby-build"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+rbenv"

DEPEND=""

src_install() {
	dobin bin/ruby-build

	insinto /usr/share
	doins -r share/ruby-build

	if use rbenv ; then
		exeinto /opt/rbenv/libexec
		doexe bin/rbenv-install
	fi

	dodoc LICENSE README.md
}
