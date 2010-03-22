# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils elisp-common

DESCRIPTION="The most useful development tools for Ruby."
HOMEPAGE="http://cx4a.org/software/rsense/"
SRC_URI="http://cx4a.org/pub/rsense/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emacs vim"

DEPEND=">=virtual/jre-1.5
	dev-lang/ruby:1.8
	vim? ( || ( app-editors/vim app-editors/gvim ) )"
RDEPEND="${DEPEND}"

SITEFILE="90${PN}-gentoo.el"

RESTRICT="mirror"

src_prepare() {
	epatch "${FILESDIR}/config-home.patch"
	epatch "${FILESDIR}/vimplugin-home.patch"
}

src_compile() {
	if use emacs; then
		elisp-compile etc/*.el
	fi
}

src_install() {
	declare RSENSE_HOME="/opt/${PN}"

	insinto ${RSENSE_HOME}
	doins -r bin lib stubs
	fperms +x ${RSENSE_HOME}/bin/rsense
	make_wrapper rsense bin/rsense ${RSENSE_HOME}

	newbin etc/config.rb rsense-config

	echo "RSENSE_HOME=${RSENSE_HOME}" > "${T}/90${PN}"
	doenvd "${T}/90${PN}"

	dodoc README.txt doc/*.txt

	if use emacs; then
		elisp-install ${PN} etc/*.el*
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi

	if use vim; then
		insinto /usr/share/vim/vimfiles/plugin
		doins etc/*.vim
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
