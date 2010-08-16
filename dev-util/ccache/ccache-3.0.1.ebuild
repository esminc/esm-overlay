# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header $

inherit multilib
RESTRICT="mirror"

DESCRIPTION="fast compiler cache"
HOMEPAGE="http://ccache.samba.org/"
MY_P="${P/_/}"
SRC_URI="http://samba.org/ftp/ccache/${MY_P}.tar.bz2"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="sys-libs/zlib"
DEPEND="${RDEPEND}"

# Note: this version is designed to be auto-detected and used if
# you happen to have Portage 2.0.X+ installed.

do_links() {
	local a
	insinto /usr/$(get_libdir)/ccache/bin
	for a in ${CHOST}-{gcc,g++,c++} gcc c++ g++; do
		dosym /usr/bin/ccache /usr/$(get_libdir)/ccache/bin/${a}
	done
}

src_install() {
	echo "CCACHE_COMPRESS=true" >"${S}/99ccache"
	doenvd "${S}/99ccache"
	dobin ccache || die
	doman ccache.1
	dodoc README.txt NEWS.txt

	diropts -m0755
	dodir /usr/$(get_libdir)/ccache/bin
	keepdir /usr/$(get_libdir)/ccache/bin

	dobin "${FILESDIR}"/ccache-config || die

	diropts -m0700
	dodir /root/.ccache
	keepdir /root/.ccache
}

pkg_preinst() {
	# Do NOT duplicate this in your ebuilds or phear of the wrath!!!
	if [[ ${ROOT} = "/" ]] ; then
		einfo "Scanning for compiler front-ends..."
		do_links
	else
		ewarn "Install is incomplete; you must run the following commands:"
		ewarn " # ccache-config --install-links"
		ewarn " # ccache-config --install-links ${CHOST}"
		ewarn "after booting or chrooting to ${ROOT} to complete installation."
	fi
}

pkg_postinst() {
	local i
	# nuke broken symlinks from previous versions that shouldn't exist
	for i in cc ${CHOST}-cc ; do
		[[ -L "${ROOT}/usr/$(get_libdir)/ccache/bin/${i}" ]] && \
			rm -rf "${ROOT}/usr/$(get_libdir)/ccache/bin/${i}"
	done
	[[ -d "${ROOT}/usr/$(get_libdir)/ccache.backup" ]] && \
		rm -fr "${ROOT}/usr/$(get_libdir)/ccache.backup"

	elog "To use ccache with **non-Portage** C compiling, add"
	elog "/usr/$(get_libdir)/ccache/bin to the beginning of your path, before /usr/bin."
	elog "Portage  will automatically take advantage of ccache with"
	elog "no additional steps.  If this is your first install of ccache, type"
	elog "something like this to set a maximum cache size of 2GB:"
	elog "# ccache -M 2G"
	elog
	elog "If you are upgrading from an older version than 3.x you should run"
	elog "# CCACHE_DIR=\"${CCACHE_DIR:-${PORTAGE_TMPDIR}/ccache}\" ccache -C"

	case "${PORTAGE_TMPDIR}/portage/*" in
		"${CCACHE_BASEDIR:-none}"/*) :;;
		*)
		ewarn "To make optimal use of the new direct mode, please set"
		ewarn "	CCACHE_BASEDIR=\"\${PORTAGE_TMPDIR}/portage\""
		ewarn "in your /etc/make.conf";;
	esac
}
