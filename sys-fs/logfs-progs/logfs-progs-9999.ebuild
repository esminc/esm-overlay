inherit eutils git

DESCRIPTION="Logfs -- mklogfs"
HOMEPAGE="http://logfs.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-kernel/linux-headers-2.6.33"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://logfs.org/logfsprogs"
EGIT_BRANCH="master"

src_unpack() {
	git_src_unpack
	cd "${S}"
}

src_compile() {
	# andrem: Compilation fails when CFLAGS is set at all !?
	emake CC="$(tc-getCC)" LDFLAGS="${LDFLAGS}" || die
}

src_install() {
	into /
	dosbin mklogfs 
}


