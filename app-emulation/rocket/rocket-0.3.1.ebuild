# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="App Container runtime"
HOMEPAGE="https://github.com/coreos/rocket"
SRC_URI="https://github.com/coreos/rocket/releases/download/v0.3.1/rocket-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+aci"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/rocket-v${PV}"

src_install() {
  dobin rkt

  if use aci; then
    insinto /usr/share/rocket
    doins *.aci
  fi
}
