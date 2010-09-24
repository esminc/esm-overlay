# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/v8/v8-2.4.3.ebuild,v 1.1 2010/09/17 00:08:36 phajdan.jr Exp $

EAPI="2"

inherit eutils flag-o-matic multilib subversion

ESVN_REPO_URI="http://v8.googlecode.com/svn/tags/${PV}"

DESCRIPTION="Google's open source JavaScript engine"
HOMEPAGE="http://code.google.com/p/v8"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="readline"

RDEPEND="readline? ( >=sys-libs/readline-6.1 )"
DEPEND="${RDEPEND}
	>=dev-util/scons-1.3.0"

v8_scons_opts() {
	echo "$(echo ${MAKEOPTS} | sed -r 's/.*(-j\s*|--jobs=)([0-9]+).*/-j\2/')"
}

src_prepare() {
	# Stop -Werror from breaking the build.
	epatch "${FILESDIR}"/${PN}-no-werror-r0.patch

	# Respect the user's CFLAGS, including the optimization level.
	epatch "${FILESDIR}"/${PN}-no-O3-r0.patch

	# Locally fix http://code.google.com/p/v8/issues/detail?id=773.
	epatch "${FILESDIR}"/${PN}-upstream-bug-773-r0.patch

	# Remove a test that is known to fail:
	# http://groups.google.com/group/v8-users/browse_thread/thread/b8a3f42b5aa18d06
	rm test/mjsunit/debug-script.js || die
}

src_configure() {
	# GCC issues multiple warnings about strict-aliasing issues in v8 code.
	append-flags -fno-strict-aliasing
}

src_compile() {
	# TODO: use SONAME, but in a way more consistent
	# with the rest of a Linux system. Currently the name
	# looks like libv8-2.2.24.so, but should be more like
	# libv8.so.2.2.24.

	local myconf=""

	use amd64 && myconf="${myconf} arch=x64"

	if use readline; then
		myconf="${myconf} console=readline"
	else
		myconf="${myconf} console=dumb"
	fi

	scons library=shared $(v8_scons_opts) ${myconf} . || die
}

src_install() {
	insinto /usr
	doins -r include || die

	dobin d8 || die

	dolib libv8.so || die

	insinto /usr/share/${PN}/tools
	doins tools/*.js || die

	dodoc AUTHORS ChangeLog || die
}

src_test() {
	tools/test.py --no-build -p dots --shell d8 || die
}
