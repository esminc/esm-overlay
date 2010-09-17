# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Open-source fulltext search engine and column store."
HOMEPAGE="http://groonga.org/"
SRC_URI="http://groonga.org/files/groonga/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="mecab"

DEPEND="mecab? ( app-text/mecab )"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_configure() {
	econf $(use_with mecab) || die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
