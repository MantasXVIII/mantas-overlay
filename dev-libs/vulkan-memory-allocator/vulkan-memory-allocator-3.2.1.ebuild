EAPI=8

DESCRIPTION="Single-header C++ library for Vulkan memory allocation"
HOMEPAGE="https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator"
SRC_URI="https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-util/vulkan-headers-1.3.261"
RDEPEND="${DEPEND}"

S="${WORKDIR}/VulkanMemoryAllocator-${PV}"

src_install() {
    insinto /usr/include
    doins include/vk_mem_alloc.h
    dodoc README.md LICENSE.txt
}
