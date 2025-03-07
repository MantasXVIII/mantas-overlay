# Copyright 2025 MantasXVIII
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Proton Pass - Encrypted password manager"
HOMEPAGE="https://proton.me/pass"
SRC_URI="https://proton.me/download/PassDesktop/linux/x64/ProtonPass.deb -> ${PN}-beta.deb" # Placeholder URL!

LICENSE="GPL-3" # Confirmed for Proton Pass
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    dev-libs/openssl
    x11-libs/gtk+:3
    sys-libs/glibc
"

S="${WORKDIR}"

src_unpack() {
    ar -x "${DISTDIR}/${PN}-beta.deb" || die "Failed to extract .deb"
    tar -xvf data.tar.xz || die "Failed to extract data.tar.xz"
}

src_install() {
    dobin usr/bin/proton-pass

    if [[ -d usr/share ]]; then
        insinto /usr/share
        doins -r usr/share/*
    fi
}

pkg_postinst() {
    einfo "Proton Pass is installed. Run 'proton-pass' to start."
}
