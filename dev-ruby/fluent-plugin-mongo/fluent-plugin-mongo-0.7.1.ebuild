# Copyright 2008-2011 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby19"

inherit ruby-fakegem

DESCRIPTION="MongoDB plugin for Fluent event collector"
HOMEPAGE="http://docs.fluentd.org/articles/out_mongo"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

ruby_add_rdepend "=app-admin/fluentd-0.10*
	=dev-ruby/mongo-1.8*"
