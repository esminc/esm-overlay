# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Simplistic interactive filtering tool"
HOMEPAGE="https://github.com/peco/peco"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-lang/go"

RDEPEND="${DEPEND}"

pkg_setup() {
	export GOPATH=$WORKDIR
}

src_prepare() {
	mkdir -p $WORKDIR/src/github.com/peco

	ln -s $WORKDIR/$P $WORKDIR/src/github.com/peco/peco

	go get github.com/jessevdk/go-flags
	go get github.com/mattn/go-runewidth
	go get github.com/nsf/termbox-go
}

src_compile() {
	go build cmd/peco/peco.go
}

src_install() {
	dobin peco
}
