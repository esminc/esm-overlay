# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit unpacker

DESCRIPTION="A hackable text editor for the 21st Century."
HOMEPAGE="https://atom.io/"
SRC_URI="https://github.com/atom/atom/releases/download/v${PV}/atom-amd64.deb -> ${P}.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	insinto /usr
	doins -r usr/share
	dobin usr/bin/atom
	dosym /usr/share/atom/resources/app/apm/bin/apm /usr/bin/apm

	find . -executable -type f | sed -e 's/^\.//' | xargs fperms +x
}
