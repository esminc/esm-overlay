# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

EAPI="2"

DESCRIPTION=""
HOMEPAGE="http://1978th.net/tokyocabinet/"
SRC_URI="http://1978th.net/tokyocabinet/rubypkg/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/tokyocabinet"
RDEPEND="${DEPEND}"
