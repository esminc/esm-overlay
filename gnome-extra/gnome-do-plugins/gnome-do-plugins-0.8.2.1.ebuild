# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gnome-do-plugins/gnome-do-plugins-0.8.2-r1.ebuild,v 1.1 2010/04/02 14:30:33 graaff Exp $

EAPI=2

inherit eutils autotools gnome2 mono versionator

MY_PN="do-plugins"
PVC=$(get_version_component_range 1-3)

DESCRIPTION="Plugins to put the Do in Gnome Do"
HOMEPAGE="http://do.davebsd.com/"
SRC_URI="https://launchpad.net/${MY_PN}/0.8/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="banshee evo"

RDEPEND=">=gnome-extra/gnome-do-${PV}
		dev-dotnet/wnck-sharp
		banshee? ( >=media-sound/banshee-1.4.2 )
		evo? ( dev-dotnet/evolution-sharp )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_prepare() {
	# Filed upstream as https://bugs.launchpad.net/do/+bug/392422
	use banshee || sed -i -r -e "/(BANSHEE_INDEXER_DLL)/d" BundledLibraries/Makefile.am

	#epatch "${FILESDIR}/${P}-mono26.patch"
	epatch "${FILESDIR}/cs0843.patch"
	epatch "${FILESDIR}/ignore-failed.patch"

	eautomake
}

src_configure() {
	econf --enable-debug=no --enable-release=yes \
		$(use banshee) \
		$(use evo evolution) \
		--disable-flickr || die "configure failed"
}

src_compile()
{
	# The make system is unfortunately broken for parallel builds and
	# upstream indicated on IRC that they have no intention to fix
	# that.
	emake -j1 || die "make failed"
}

pkg_postinst()
{
	ewarn "Plugin handling has changed since gnome-do 0.4."
	ewarn "If you install the gnome-do-plugins package you will have local copies"
	ewarn "of the plugins, but you still need to manually enable them in Preferences."
	ewarn "Also note that plugins installed from upstream may not be compatible with"
	ewarn "your system. When in doubt check the output from gnome-do itself".
	ewarn "Old plugins may not be compatible either."
	ewarn "Check ~/.local/share/gnome-do/ if you have problems with plugins."
}
