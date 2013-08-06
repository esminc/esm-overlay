EAPI=4

EGIT_REPO_URI="git://github.com/ysbaddaden/prax.git"
CONFIG_CHECK="~NF_NAT ~NETFILTER_XT_TARGET_REDIRECT"

inherit git-2 eutils linux-info

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

pkg_postinst() {
	einfo "Edit /etc/nsswitch.conf and add prax to the hosts line."
	einfo
	einfo "    # /etc/nsswitch.conf"
	einfo "    ..."
	einfo "    hosts: files dns prax"
	einfo "    ..."
	einfo
}
