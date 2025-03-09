# Copyright 2025 MantasXVIII
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Proton Mail - Encrypted email desktop app (beta)"
HOMEPAGE="https://proton.me/mail"
SRC_URI="https://proton.me/download/mail/linux/ProtonMail-desktop-beta.deb -> ${PN}-beta.deb"

LICENSE="GPL-3" # Verify with Proton
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
    # Install the binary
    dobin usr/bin/proton-mail

    # Install libffmpeg.so to /usr/lib/
    insinto /usr/lib
    doins usr/lib/proton-mail/libffmpeg.so

    # Install additional files (e.g., desktop entries, icons)
    if [[ -d usr/share ]]; then
        insinto /usr/share
        doins -r usr/share/*
    fi
}

pkg_postinst() {
    # Update library cache
    ldconfig
    einfo "Proton Mail (beta) is installed. Run 'proton-mail' to start."
}
