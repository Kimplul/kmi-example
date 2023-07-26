CROSS_COMPILE = riscv64-linux-gnu-

all: kmi uboot opensbi

.PHONY: kmi uboot opensbi
kmi:
	$(MAKE) -C kmi CROSS_COMPILE=$(CROSS_COMPILE)

uboot:
	$(MAKE) -C rv64/u-boot-kmi qemu-riscv64_smode_defconfig
	$(MAKE) -C rv64/u-boot-kmi CROSS_COMPILE=$(CROSS_COMPILE)

opensbi:
	$(MAKE) -C rv64/opensbi CROSS_COMPILE=$(CROSS_COMPILE) PLATFORM=generic

.PHONY: clean
clean:
	$(MAKE) -C kmi clean
	$(MAKE) -C rv64/u-boot-kmi clean
	$(MAKE) -C rv64/opensbi clean

.PHONY: run
run:
	$(MAKE) -C kmi run
