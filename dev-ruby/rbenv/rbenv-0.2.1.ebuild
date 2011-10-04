# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit bash-completion

DESCRIPTION="Simple Ruby Version Management"
HOMEPAGE="https://github.com/sstephenson/rbenv"
SRC_URI="https://github.com/sstephenson/rbenv/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash-completion +ruby-build zsh-completion"

DEPEND="ruby-build? ( dev-ruby/ruby-build[rbenv] )
	zsh-completion? ( app-shells/zsh )"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* ${S}
}

src_prepare() {
	epatch "${FILESDIR}/disable-completion.patch"
}

src_install() {
	exeinto /usr/libexec
	doexe libexec/*

	dosym /usr/libexec/rbenv /usr/bin/rbenv
	dobin bin/ruby-local-exec

	dobashcompletion completions/rbenv.bash ${PN}

	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		newins completions/rbenv.zsh _rbenv
	fi

	dodoc LICENSE README.md

	insinto /etc/profile.d
	doins ${FILESDIR}/rbenv.sh
}
