CROSS_COMPILE = riscv64-linux-gnu-

all: kmi uboot opensbi

.PHONY: kmi uboot opensbi
kmi:
	make -C kmi CROSS_COMPILE=$(CROSS_COMPILE) -j$$(nproc)

uboot:
	make -C rv64/u-boot-kmi qemu-riscv64_smode_defconfig
	make -C rv64/u-boot-kmi CROSS_COMPILE=$(CROSS_COMPILE) -j$$(nproc)

opensbi:
	make -C rv64/opensbi CROSS_COMPILE=$(CROSS_COMPILE) PLATFORM=generic -j$$(nproc)

.PHONY: clean
clean:
	make -C kmi clean
	make -C rv64/u-boot-kmi clean
	make -C rv64/opensbi clean

.PHONY: run
run:
	make -C kmi run
