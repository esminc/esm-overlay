# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit eutils

DESCRIPTION="Dropbox allows you to sync your files online and across your computers automatically."
HOMEPAGE="https://www.dropbox.com/"
SRC_URI="x86? ( http://dl-web.getdropbox.com/u/17/dropbox-lnx.x86-${PV}.tar.gz )
	amd64? ( http://dl-web.getdropbox.com/u/17/dropbox-lnx.x86_64-${PV}.tar.gz )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}

RESTRICT="mirror strip"

src_install() {
	declare DROPBOX_HOME=/opt/dropbox

	dodir ${DROPBOX_HOME}
	cp -r .dropbox-dist/* ${D}${DROPBOX_HOME} || die
	dosym ${DROPBOX_HOME}/dropboxd /usr/bin/dropboxd || die
}
