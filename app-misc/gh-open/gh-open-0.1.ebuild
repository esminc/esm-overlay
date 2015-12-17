# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="GitHub remote url open command"
HOMEPAGE="https://github.com/typester/gh-open"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/gh-open_${PV}_linux_amd64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${A%.tar.gz}"

src_install() {
	dobin gh-open
	dodoc README.org
}
