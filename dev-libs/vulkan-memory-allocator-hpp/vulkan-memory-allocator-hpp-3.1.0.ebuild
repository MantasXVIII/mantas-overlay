EAPI=8

DESCRIPTION="C++ bindings for Vulkan Memory Allocator"
HOMEPAGE="https://github.com/YaaZ/VulkanMemoryAllocator-Hpp"
SRC_URI="https://github.com/YaaZ/VulkanMemoryAllocator-Hpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
    >=dev-util/vulkan-headers-1.3.261
    >=dev-libs/vulkan-memory-allocator-3.0.1
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/VulkanMemoryAllocator-Hpp-${PV}"

src_install() {
    insinto /usr/include
    doins vk_mem_alloc.hpp
    dodoc README.md
}
