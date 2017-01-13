# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="The App Engine SDK for Go"
HOMEPAGE="https://cloud.google.com/appengine/docs/go/download"
SRC_URI="https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-${PV}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/python:2.7"

S="${WORKDIR}/go_appengine"

src_install() {
	dodir /opt/${PN}
	cp -R * ${D}/opt/${PN}/
	dosym /opt/${PN}/goapp /usr/bin/goapp
}
