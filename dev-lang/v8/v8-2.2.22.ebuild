# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs subversion

DESCRIPTION="Google's open source JavaScript engine"
HOMEPAGE="http://code.google.com/p/v8/"
ESVN_REPO_URI="http://v8.googlecode.com/svn/tags/${PV}"
ESVN_PROJECT="v8"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND=""

DEPEND="${RDEPEND}
	dev-util/scons"

src_compile() {
	OPTS="mode=release snapshot=on library=shared"

	if use amd64; then
		OPTS="${OPTS} arch=x64"
	fi

	if [ "$(gcc-version)" == "4.4" ]; then
		export GCC_VERSION=44
	fi

	scons ${OPTS} ${MAKEOPTS} || die
}

src_install() {
	insinto /usr
	doins -r include
	insinto /usr/lib
	doins lib*
}
