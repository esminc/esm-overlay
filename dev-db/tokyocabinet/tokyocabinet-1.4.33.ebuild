# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A high performance database library similar to the DBM family"
HOMEPAGE="http://1978th.net/tokyocabinet/"
SRC_URI="http://1978th.net/tokyocabinet/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bzip2 lzma lzo ruby threads zlib"

DEPEND="bzip2? ( app-arch/bzip2 )
	lzma? ( app-arch/lzma )
	lzo? ( dev-libs/lzo )
	zlib? ( sys-libs/zlib )
	ruby? ( dev-ruby/tokyocabinet-ruby )"
RDEPEND="${DEPEND}"

src_compile() {
	econf \
		$(use_enable bzip2 bzip) \
		$(use_enable lzma exlzma) \
		$(use_enable lzo exlzo) \
		$(use_enable threads pthread) \
		$(use_enable zlib) || die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	rm -rf "${D}usr/share/tokyocabinet"

	dodoc ChangeLog README THANKS || die
	dohtml doc/* || die
}
