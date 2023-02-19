# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A generic function and convention to trigger deprecation notices"
HOMEPAGE="https://github.com/symfony/deprecation-contracts"
SRC_URI="https://github.com/symfony/deprecation-contracts/archive/v${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	dev-lang/php:*"

S="${WORKDIR}/deprecation-contracts-${PV}"

src_install() {
	insinto '/usr/share/php/Symfony/Component/DeprecationContracts'
	doins -r *

	einstalldocs
}
