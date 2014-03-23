# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19 ruby20"
RUBY_FAKEGEM_NAME="http_parser.rb"

inherit ruby-fakegem

DESCRIPTION="Ruby bindings to http-parser"
HOMEPAGE="http://github.com/tmm1/http_parser.rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

each_ruby_configure() {
	${RUBY} -C ext/ruby_http_parser extconf.rb || die
}

each_ruby_compile() {
	emake -C ext/ruby_http_parser || die
}

each_ruby_install() {
	cp -r ext/*/*.so lib || die
	each_fakegem_install
}
