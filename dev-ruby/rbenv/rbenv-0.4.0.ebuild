# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Simple Ruby Version Management"
HOMEPAGE="https://github.com/sstephenson/rbenv"
SRC_URI="https://github.com/sstephenson/rbenv/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="deprecated +ruby-build"

DEPEND="ruby-build? ( dev-ruby/ruby-build[rbenv] )"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* ${S}
}

src_install() {
	exeinto /opt/rbenv/libexec
	doexe libexec/*

	insinto /opt/rbenv/completions
	doins completions/*

	dosym /opt/rbenv/libexec/rbenv /usr/bin/rbenv

	if use deprecated ; then
		dobin bin/ruby-local-exec
	fi

	dodoc LICENSE README.md
}

pkg_postinst() {
	elog "Add rbenv init to your shell to enable shims and autocompletion."
	elog
	elog "  $ echo 'eval \"\$(rbenv init -)\"' >> ~/.bash_profile"
	elog
	elog "Same as in previous step, use ~/.profile on Ubuntu, ~/.zshrc for Zsh."
}
