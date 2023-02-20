# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A generic function and convention to trigger deprecation notices"
HOMEPAGE="https://github.com/symfony/deprecation-contracts"
SRC_URI="https://github.com/symfony/deprecation-contracts/archive/v${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

BDEPEND="dev-php/theseer-Autoload"

RDEPEND="
	dev-lang/php:*"

S="${WORKDIR}/deprecation-contracts-${PV}"

src_prepare() {
	default

	echo "<?php" >> autoload.php
	echo "\Fedora\Autoloader\Dependencies::required([__DIR__ . '/function.php']);" >> autoload.php
}


src_install() {
	insinto '/usr/share/php/Symfony/Component/DeprecationContracts'
	doins -r *.php

	einstalldocs
}
