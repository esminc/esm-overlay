# Copyright 2008-2012 Gentoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit distutils git-2

DESCRIPTION="adds flavor of interactive filtering to the traditional pipe concept of UNIX shell"
HOMEPAGE="https://github.com/mooz/percol"

LICENSE="AS_IS"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="${HOMEPAGE}"
EGIT_BRANCH="master"
