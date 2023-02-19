# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Simple unix signal handler that silently fails on windows for easy cross-platform development"
HOMEPAGE="https://github.com/Seldaek/signal-handler"
SRC_URI="https://github.com/Seldaek/signal-handler/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

BDEPEND="dev-php/theseer-Autoload"

RDEPEND="dev-php/fedora-autoloader
	dev-lang/php:*"

src_prepare() {
	default

	phpab \
		--output src/autoload.php \
		--template fedora2 \
		--basedir src/ \
		src \
		|| die
}

src_install() {
	insinto "/usr/share/php/Seld/SignalHandler"
	doins -r src/.

	einstalldocs
}