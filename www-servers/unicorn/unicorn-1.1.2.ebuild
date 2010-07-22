# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
USE_RUBY="ruby18 ruby19"

inherit ruby-fakegem

DESCRIPTION="Rack HTTP server for fast clients and Unix"
HOMEPAGE="http://unicorn.bogomips.org/"
SRC_URI="mirror://rubygems/${P}.gem"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

ruby_add_rdepend "dev-ruby/rack"

each_ruby_prepare() {
	cd ext/unicorn_http
	${RUBY} extconf.rb || die 'extconf.rb failed'
}

each_ruby_compile() {
	cd ext/unicorn_http
	emake || die 'emake failed'
}

all_ruby_install() {
	doman man/man*/* || die 'doman failed'
	all_fakegem_install
}

each_ruby_install() {
	cp ext/unicorn_http/*.so lib
	each_fakegem_install
}
