EAPI=5

DESCRIPTION="Elixir is a metaprogrammable, functional language built atop the Erlang VM"
HOMEPAGE="http://elixir-lang.org/"
SRC_URI="https://github.com/elixir-lang/elixir/archive/v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-util/rebar"
RDEPEND=">=dev-lang/erlang-16"

src_compile() {
	emake compile || die "emake compile failed"
}

src_install() {
	emake INSTALL_PATH="${D}/usr" install || die "emake install failed"
}
