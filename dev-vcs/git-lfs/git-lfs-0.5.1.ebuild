# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Git extension for versioning large files"
HOMEPAGE="https://git-lfs.github.com"
SRC_URI="https://github.com/github/${PN}/releases/download/v${PV}/${PN}-linux-amd64-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-vcs/git"

src_install() {
	dobin git-lfs
}
