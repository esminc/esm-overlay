# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="An input method engine for Fcitx"
HOMEPAGE="https://github.com/fcitx/fcitx-skk"
SRC_URI="https://github.com/fcitx/fcitx-skk/archive/0.1.1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=app-i18n/fcitx-4.2.8
	app-i18n/libskk
	app-i18n/skk-jisyo"
RDEPEND="${DEPEND}"
