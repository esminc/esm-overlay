# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Automatically install gems every time you install a new version of Ruby"
HOMEPAGE="https://github.com/sstephenson/rbenv-default-gems"
SRC_URI="https://github.com/sstephenson/rbenv-default-gems/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-ruby/rbenv"
RDEPEND="${DEPEND}"

src_install() {
	insinto /etc/rbenv.d
	doins -r etc/rbenv.d/install
}
