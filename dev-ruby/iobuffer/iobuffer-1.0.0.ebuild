# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/iobuffer/iobuffer-1.0.0.ebuild,v 1.1 2011/01/02 10:51:20 graaff Exp $

EAPI="2"
USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES README.rdoc"

RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="IO::Buffer is a fast byte queue which is primarily intended for non-blocking I/O applications"
HOMEPAGE="http://mynyml.com/ruby/flexible-continuous-testing"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE=""

each_ruby_prepare() {
	sed -i "s/lib\/iobuffer/ext\/iobuffer/" spec/buffer_spec.rb || die
}

each_ruby_configure() {
	${RUBY} -C ext extconf.rb || die "Failed to configure the extension."
}

each_ruby_compile() {
	emake -C ext || die "Failed to compile the extension."
}

each_ruby_test() {
	${RUBY} -Iext -S spec spec/buffer_spec.rb
}

each_ruby_install() {
	cp -r ext/*.so lib || die "Failed to install the extension."
	each_fakegem_install
}
