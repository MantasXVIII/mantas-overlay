EAPI=8

DESCRIPTION="C++ bindings for Vulkan Memory Allocator"
HOMEPAGE="https://github.com/YaaZ/VulkanMemoryAllocator-Hpp"
SRC_URI="https://github.com/YaaZ/VulkanMemoryAllocator-Hpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
    >=dev-libs/vulkan-memory-allocator-3.0.1
    >=dev-util/vulkan-headers-1.3.261
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/VulkanMemoryAllocator-Hpp-${PV}"

src_install() {
    insinto /usr/include
    doins include/vk_mem_alloc.hpp
    doins include/vk_mem_alloc_enums.hpp
    doins include/vk_mem_alloc_funcs.hpp
    doins include/vk_mem_alloc_handles.hpp
    doins include/vk_mem_alloc_raii.hpp
    doins include/vk_mem_alloc_structs.hpp
    dodoc README.md LICENSE
}
