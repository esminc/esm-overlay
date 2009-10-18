# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/rails/rails-2.3.4.ebuild,v 1.6 2009/09/25 18:20:04 ranger Exp $

inherit ruby gems
USE_RUBY="ruby18 ruby19"

DESCRIPTION="Passenger gem for use with nginx or apache"
HOMEPAGE="http://www.modrails.com"

LICENSE="MIT"
KEYWORDS="amd64 ia64 ppc ppc64 sparc x86 ~x86-fbsd"

IUSE="nginx"
DEPEND=">=dev-lang/ruby-1.8.6"

RDEPEND="${DEPEND}
	>=dev-ruby/rubygems-1.3.2
	>=dev-ruby/rake-0.8.1
	>=dev-ruby/fastthread-1.0.1"

src_install() {
	gems_src_install
	# Rename slotted files that may clash so that eselect can handle
	# them
	use nginx &&
	    pushd "${D}/usr/lib64/ruby/gems/1.8/gems/passenger-2.2.5/ext/nginx" &&
	    rake nginx &&
		popd
}
