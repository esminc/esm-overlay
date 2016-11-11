# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="mruby-cli is a platform to build native command line applications for Linux, Windows, and OS X"
HOMEPAGE="https://github.com/hone/mruby-cli"
SRC_URI="https://github.com/hone/mruby-cli/releases/download/v${PV}/mruby-cli-${PV}-x86_64-pc-linux-gnu.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	dobin mruby-cli
}
