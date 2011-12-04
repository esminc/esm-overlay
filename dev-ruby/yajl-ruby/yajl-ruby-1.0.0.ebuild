# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/yajl-ruby/yajl-ruby-0.8.3.ebuild,v 1.1 2011/08/20 11:38:15 graaff Exp $

EAPI=2

USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC=""

inherit multilib ruby-fakegem

DESCRIPTION="Ruby C bindings to the Yajl JSON stream-based parser library"
HOMEPAGE="http://github.com/brianmario/yajl-ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="${RDEPEND} dev-libs/yajl"
DEPEND="${DEPEND} dev-libs/yajl"

ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"

each_ruby_configure() {
	${RUBY} -Cext/yajl extconf.rb || die "extconf.rb failed"
}

each_ruby_compile() {
	emake -Cext/yajl CFLAGS="${CFLAGS} -fPIC" archflag="${LDFLAGS}" || die "make extension failed"
	cp ext/yajl/yajl$(get_modname) lib/yajl/ || die
}

each_ruby_test() {
	${RUBY} -Ilib -S rspec spec || die "Tests failed"
}
