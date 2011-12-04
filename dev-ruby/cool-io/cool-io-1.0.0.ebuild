# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_NAME="cool.io"
RUBY_FAKEGEM_EXTRADOC="CHANGES README.markdown"

inherit ruby-fakegem

DESCRIPTION="cool.io is a high performance event library for Ruby built on top of libev"
HOMEPAGE="http://coolio.github.com/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

ruby_add_rdepend ">=dev-ruby/iobuffer-0.1.3"

each_ruby_configure() {
	${RUBY} -C ext/cool.io extconf.rb || die
	${RUBY} -C ext/http11_client extconf.rb || die
}

each_ruby_compile() {
	emake -C ext/cool.io || die
	emake -C ext/http11_client || die
}

each_ruby_install() {
	ruby_fakegem_doins VERSION || die
	cp ext/*/*.so lib || die

	each_fakegem_install
}
