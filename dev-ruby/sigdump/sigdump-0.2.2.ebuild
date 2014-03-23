EAPI=4

USE_RUBY="ruby19 ruby20 ruby21"
RUBY_FAKEGEM_NAME="sigdump"

inherit ruby-fakegem

DESCRIPTION="SIGQUIT of Java VM for Ruby"
HOMEPAGE="https://github.com/frsyuki/sigdump"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
