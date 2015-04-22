# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Unclutter your .profile"
HOMEPAGE="http://direnv.net/"
SRC_URI="https://github.com/zimbatm/direnv/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" build

	dobin direnv
	doman man/*.1
	dodoc README.md
}
