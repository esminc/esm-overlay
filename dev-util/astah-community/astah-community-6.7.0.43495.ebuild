# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_PV="${PV%.*}-${PV##*.}"
SRC_URI="${PN}-${MY_PV//./_}.zip"
DESCRIPTION="Lightweight UML Editor"
HOMEPAGE="http://astah.change-vision.com/"
LICENSE="no-source-code"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE=""
S="${WORKDIR}/astah_community"

DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jre-1.4"
RESTRICT="fetch"

pkg_nofetch() {
	einfo "Please download ${SRC_URI} from ${HOMEPAGE} and move it to ${DISTDIR}"
}

src_install() {
	dodir /opt/${PN}

	cd $S

	dodoc *.txt *.html
	rm *.txt *.html astah
	cp -rdp * ${D}/opt/${PN}
	exeinto /opt/${PN}

	echo "#!/bin/sh" > astah
	echo "ASTAH_HOME=/opt/${PN}" >> astah
	echo "ASTAH_JAR=astah-community.jar" >> astah
	echo "CLASSPATH=\$ASTAH_HOME/\$ASTAH_JAR" >> astah
	echo "JAVA_OPTS='-Xms16m -Xmx512m -Xss2m'" >> astah
	echo "java \$JAVA_OPTS -jar \$ASTAH_HOME/\$ASTAH_JAR  \$1 \$2 \$3" >> astah
	doexe astah

	dodir /opt/bin
	insinto /opt/bin
	dosym /opt/${PN}/astah /opt/bin/astah
}

pkg_postinst() {
	einfo ""
	einfo "HOW TO RUN astah"
	einfo ""
	einfo "Just type \"astah\" as normal user from command line!"
	einfo "You can also create a shortcut on your desktop..."
	einfo ""
}
