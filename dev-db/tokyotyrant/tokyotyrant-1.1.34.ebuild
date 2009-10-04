# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="A package of network interface to the DBM called Tokyo Cabinet"
HOMEPAGE="http://1978th.net/tokyotyrant/"
SRC_URI="http://1978th.net/tokyotyrant/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/tokyocabinet"
RDEPEND="${DEPEND}"


src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	rm -rf "${D}usr/share/tokyotyrant"

	dodoc ChangeLog README THANKS || die
	dohtml doc/* || die
}
