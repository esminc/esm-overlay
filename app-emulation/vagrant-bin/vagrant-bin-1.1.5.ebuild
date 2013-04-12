# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Vagrant is a tool for building and distributing working environments."
HOMEPAGE="http://www.vagrantup.com/"
SRC_URI="http://files.vagrantup.com/packages/64e360814c3ad960d810456add977fd4c7d47ce6/vagrant_x86_64.pkg.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

RESTRICT="strip"

src_install() {
  dobin usr/bin/vagrant

  cp -rdp "${S}/opt" "${D}/opt"
}
