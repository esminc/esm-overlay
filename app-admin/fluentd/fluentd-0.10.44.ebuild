# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby19 ruby20"

inherit user ruby-fakegem

DESCRIPTION="An event collector daemon"
HOMEPAGE="http://fluentd.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

ruby_add_rdepend ">=dev-ruby/coolio-1.1.1
	<dev-ruby/coolio-2.0.0
	!=dev-ruby/coolio-1.2.0
	>=dev-ruby/http_parser-rb-0.5.1
	<dev-ruby/http_parser-rb-0.6.0
	>=dev-ruby/json-1.4.3
	>=dev-ruby/msgpack-0.4.4
	<dev-ruby/msgpack-0.6.0
	!=dev-ruby/msgpack-0.5.0
	!=dev-ruby/msgpack-0.5.1
	!=dev-ruby/msgpack-0.5.2
	!=dev-ruby/msgpack-0.5.3
	>=dev-ruby/sigdump-0.2.2
	<dev-ruby/sigdump-0.3.0
	=dev-ruby/yajl-ruby-1*"

pkg_setup() {
	enewgroup fluent
	enewuser fluent -1 -1 /var/lib/fluent fluent
}

all_ruby_install() {
	keepdir /run/fluent /var/{lib,log}/fluent
	fowners fluent:fluent /run/fluent /var/{lib,log}/fluent

	newinitd "${FILESDIR}/${PN}.initd" ${PN} || die
	newconfd "${FILESDIR}/${PN}.confd" ${PN} || die

	insinto /etc/fluent
	doins fluent.conf || die

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" ${PN} || die

	all_fakegem_install
}
