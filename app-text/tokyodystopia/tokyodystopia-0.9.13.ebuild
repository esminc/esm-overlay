# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="A full-text search system. You can search lots of records for some records including specified patterns."
HOMEPAGE="http://1978th.net/tokyodystopia/"
SRC_URI="http://1978th.net/tokyodystopia/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/tokyocabinet"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	rm -rf "${D}usr/share/tokyodystopia"

	dodoc ChangeLog README THANKS || die
	dohtml doc/* || die
}
