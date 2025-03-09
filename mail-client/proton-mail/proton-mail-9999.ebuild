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

    # Install libffmpeg.so to architecture-specific lib dir (e.g., /usr/lib64/)
    insinto "/usr/$(get_libdir)"
    doins usr/lib/proton-mail/libffmpeg.so

    # Install desktop entries and icons from usr/share/, excluding docs
    if [[ -d usr/share/applications ]]; then
        insinto /usr/share/applications
        doins usr/share/applications/*
    fi
    if [[ -d usr/share/icons ]]; then
        insinto /usr/share/icons
        doins -r usr/share/icons/*
    fi

    # Install documentation to correct path
    if [[ -d usr/share/doc/proton-mail ]]; then
        dodoc -r usr/share/doc/proton-mail/*
    fi
}

pkg_postinst() {
    ldconfig
    einfo "Proton Mail (beta) is installed. Run 'proton-mail' to start."
}
