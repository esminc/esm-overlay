EAPI=6

DESCRIPTION="A plugin manager for zsh, inspired by oh-my-zsh and vundle"
HOMEPAGE="https://github.com/zsh-users/antigen"
SRC_URI="https://github.com/zsh-users/antigen/releases/download/v${PV}/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-shells/zsh"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	insinto /usr/share
	doins bin/antigen.zsh
}
