# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Service orchestration and management tool"
HOMEPAGE="http://www.serfdom.io/"
SRC_URI="https://dl.bintray.com/mitchellh/serf/${PV}_linux_amd64.zip"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	dobin serf

	newinitd ${FILESDIR}/serf-agent.initd serf-agent
	newconfd ${FILESDIR}/serf-agent.confd serf-agent

	insinto /etc/logrotate.d
	newins  ${FILESDIR}/serf.logrotate serf

	keepdir /run/serf /var/log/serf
}
