# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

DESCRIPTION="A beautiful cross platform Desktop Player for Google Play Music"
HOMEPAGE="https://www.googleplaymusicdesktopplayer.com/"
SRC_URI="https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/v${PV}/google-play-music-desktop-player_${PV}_amd64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	cp -R "${S}/usr/" "${D}" || die
}
