EAPI=4

EGIT_REPO_URI="git://github.com/ysbaddaden/prax.git"

inherit git-2 eutils

DESCRIPTION="Rack proxy server for development"
HOMEPAGE="http://ysbaddaden.github.io/prax/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/ruby
	net-firewall/iptables"

src_compile() {
	cd ext
	emake
}

src_install() {
	insinto /$(get_libdir)
	doins ext/libnss_prax.so.2

	insinto /opt/prax
	doins -r lib ssl templates

	exeinto /opt/prax/bin
	doexe bin/racker

	exeinto /opt/prax/libexec
	doexe libexec/*

	dosym /opt/prax/libexec/prax /usr/bin/prax

	newinitd ${FILESDIR}/prax.initd prax
}
