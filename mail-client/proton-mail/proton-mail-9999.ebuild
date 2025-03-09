# Copyright 2025 MantasXVIII
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg

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

QA_PREBUILT="*"

S="${WORKDIR}"

src_install() {
    # Unpack directly into the install root
    dodir /
    cd "${ED}" || die
    unpacker "${DISTDIR}/${PN}-beta.deb"

    # Remove etc/ only if it exists
    if [[ -d etc ]]; then
        rm -r etc || die "Failed to remove etc"
    fi

    # Move docs to Gentoo standard path
    if [[ -d usr/share/doc/proton-mail ]]; then
        mv usr/share/doc/proton-mail "${ED}/usr/share/doc/${PF}" || die "Failed to move docs"
    fi

    # Ensure binary is executable
    chmod 755 "${ED}/usr/bin/proton-mail" || die "Failed to set executable permissions"
}

pkg_postinst() {
    ldconfig
    xdg_pkg_postinst
    einfo "Proton Mail (beta) is installed. Run 'proton-mail' to start."
}
