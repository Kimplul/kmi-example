# kmi-example

Example setup for RISC-V 64 bit kmi kernel. Compiles `kmi`, `opensbi` and `u-boot` and
loads them all into `qemu` along with the example program in `kmi`, `arch/riscv64/conf/init.c`.

# Building

+ `make`
+ `make run`

You may need `sudo make run` instead, as `make run` generates a disk image which currently
on some (all?) systems requires root privileges. You should see a `qemu` monitor pop up,
press `c` in it and in the terminal you launched the commands from you should see something akin to:
```
make -C kmi run
make[1]: Entering directory '/home/kimi/Projects/kmi/kmi-example/kmi'
arch/riscv64/conf/mkimage.sh riscv64
FIT description: FUCK
Created:         Sat May  6 21:26:54 2023
 Image 0 (kernel)
  Description:  Garbaggio
  Created:      Sat May  6 21:26:54 2023
  Type:         Kernel Image
  Compression:  uncompressed
  Data Size:    82336 Bytes = 80.41 KiB = 0.08 MiB
  Architecture: RISC-V
  OS:           kmi
  Load Address: 0x80240000
  Entry Point:  0x80240000
  Hash algo:    sha1
  Hash value:   adc8199ac8f510119dbb481117443b22c4a61ef8
 Image 1 (initrd)
  Description:  Gargabbio initrd
  Created:      Sat May  6 21:26:54 2023
  Type:         RAMDisk Image
  Compression:  uncompressed
  Data Size:    4096 Bytes = 4.00 KiB = 0.00 MiB
  Architecture: RISC-V
  OS:           kmi
  Load Address: 0x88300000
  Entry Point:  unavailable
  Hash algo:    sha1
  Hash value:   68040f04970f0abe4f2e81f9c35e55116f28e384
 Default Configuration: 'config'
 Configuration 0 (config)
  Description:  Default configuration
  Kernel:       kernel
  Init Ramdisk: initrd
  Hash algo:    sha1
  Hash value:   unavailable
Image Name:
Created:      Sat May  6 21:26:54 2023
Image Type:   RISC-V kmi Script (gzip compressed)
Data Size:    171 Bytes = 0.17 KiB = 0.00 MiB
Load Address: 00000000
Entry Point:  00000000
Contents:
   Image 0: 163 Bytes = 0.16 KiB = 0.00 MiB

OpenSBI v1.2
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|___/_____|
        | |
        |_|

Platform Name             : riscv-virtio,qemu
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : aclint-mswi
Platform Timer Device     : aclint-mtimer @ 10000000Hz
Platform Console Device   : uart8250
Platform HSM Device       : ---
Platform PMU Device       : ---
Platform Reboot Device    : sifive_test
Platform Shutdown Device  : sifive_test
Platform Suspend Device   : ---
Platform CPPC Device      : ---
Firmware Base             : 0x80000000
Firmware Size             : 232 KB
Firmware RW Offset        : 0x20000
Runtime SBI Version       : 1.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x0000000002000000-0x000000000200ffff M: (I,R,W) S/U: ()
Domain0 Region01          : 0x0000000080000000-0x000000008001ffff M: (R,X) S/U: ()
Domain0 Region02          : 0x0000000080020000-0x000000008003ffff M: (R,W) S/U: ()
Domain0 Region03          : 0x0000000000000000-0xffffffffffffffff M: (R,W,X) S/U: (R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x0000000082200000
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes
Domain0 SysSuspend        : yes

Boot HART ID              : 0
Boot HART Domain          : root
Boot HART Priv Version    : v1.12
Boot HART Base ISA        : rv64imafdch
Boot HART ISA Extensions  : time,sstc
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4
Boot HART PMP Address Bits: 54
Boot HART MHPM Count      : 16
Boot HART MIDELEG         : 0x0000000000001666
Boot HART MEDELEG         : 0x0000000000f0b509


U-Boot 2023.07-rc1-g5a1cf8bc8f (May 06 2023 - 21:26:09 +0300)

CPU:   rv64imafdch_zicsr_zifencei_zihintpause_zba_zbb_zbc_zbs_sstc
Model: riscv-virtio,qemu
DRAM:  2 GiB
Core:  27 devices, 14 uclasses, devicetree: board
Flash: 32 MiB
Loading Environment from nowhere... OK
In:    serial@10000000
Out:   serial@10000000
Err:   serial@10000000
Net:   No ethernet found.
Working FDT set to ff72f950
Hit any key to stop autoboot:  0

Device 0: QEMU VirtIO Block Device
            Type: Hard Disk
            Capacity: 10.0 MB = 0.0 GB (20480 x 512)
... is now current device
Scanning virtio 0:1...
Found U-Boot script /boot.scr
235 bytes read in 0 ms
## Executing script at 8c100000
Working FDT set to 8c000000
Working FDT set to 8c000000
88232 bytes read in 0 ms
## Loading kernel from FIT Image at 84000000 ...
   Using 'config' configuration
   Trying 'kernel' kernel subimage
     Description:  Garbaggio
     Type:         Kernel Image
     Compression:  uncompressed
     Data Start:   0x840000b0
     Data Size:    82336 Bytes = 80.4 KiB
     Architecture: RISC-V
     OS:           kmi
     Load Address: 0x80240000
     Entry Point:  0x80240000
     Hash algo:    sha1
     Hash value:   adc8199ac8f510119dbb481117443b22c4a61ef8
   Verifying Hash Integrity ... sha1+ OK
## Loading ramdisk from FIT Image at 84000000 ...
   Using 'config' configuration
   Trying 'initrd' ramdisk subimage
     Description:  Gargabbio initrd
     Type:         RAMDisk Image
     Compression:  uncompressed
     Data Start:   0x8401433c
     Data Size:    4096 Bytes = 4 KiB
     Architecture: RISC-V
     OS:           kmi
     Load Address: 0x88300000
     Entry Point:  unavailable
     Hash algo:    sha1
     Hash value:   68040f04970f0abe4f2e81f9c35e55116f28e384
   Verifying Hash Integrity ... sha1+ OK
   Loading ramdisk from 0x8401433c to 0x88300000
## Flattened Device Tree blob at 8c000000
   Booting using the fdt blob at 0x8c000000
Working FDT set to 8c000000
   Loading Kernel Image
## Transferring control to kernel (at address 80240000) ...
reserved-memory: {
        #address-cells = <0x00000002>;
        #size-cells = <0x00000002>;
        ranges;
        mmode_resv1@80020000: {
                reg = <0x00000000 0x80020000 0x00000000 0x00020000>;
        };

        mmode_resv0@80000000: {
                reg = <0x00000000 0x80000000 0x00000000 0x00020000>;
        };

};

fw-cfg@10100000: {
        dma-coherent;
        reg = <0x00000000 0x10100000 0x00000000 0x00000018>;
        compatible = "qemu,fw-cfg-mmio";
};

flash@20000000: {
        bank-width = <0x00000004>;
        reg = <0x00000000 0x20000000 0x00000000 0x02000000 0x00000000 0x22000000 0x00000000 0x02000000>;
        compatible = "cfi-flash";
};

chosen: {
        linux,initrd-end = <0x00000000 0x88301000>;
        linux,initrd-start = <0x00000000 0x88300000>;
        u-boot,bootconf = "config";
        boot-hartid = <0x00000000>;
        u-boot,version = "2023.07-rc1-g5a1cf8bc8f";
        rng-seed = <0xf6627404 0xdfc2f3d3 0x9c569a75 0x32209f08 0x6f1d68df 0x173d1d50 0xcdc80a8c 0xeac1fc5d>;
        stdout-path = "/soc/serial@10000000";
};

poweroff: {
        value = <0x00005555>;
        offset = <0x00000000>;
        regmap = <0x00000004>;
        compatible = "syscon-poweroff";
};

reboot: {
        value = <0x00007777>;
        offset = <0x00000000>;
        regmap = <0x00000004>;
        compatible = "syscon-reboot";
};

platform-bus@4000000: {
        interrupt-parent = <0x00000003>;
        ranges = <0x00000000 0x00000000 0x04000000 0x02000000>;
        #address-cells = <0x00000001>;
        #size-cells = <0x00000001>;
        compatible = "qemu,platform", "simple-bus";
};

memory@80000000: {
        device_type = "memory";
        reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
};

cpus: {
        #address-cells = <0x00000001>;
        #size-cells = <0x00000000>;
        timebase-frequency = <0x00989680>;
        cpu@0: {
                phandle = <0x00000001>;
                device_type = "cpu";
                reg = <0x00000000>;
                status = "okay";
                compatible = "riscv";
                riscv,isa = "rv64imafdch_zicsr_zifencei_zihintpause_zba_zbb_zbc_zbs_sstc";
                mmu-type = "riscv,sv48";
                interrupt-controller: {
                        #interrupt-cells = <0x00000001>;
                        interrupt-controller;
                        compatible = "riscv,cpu-intc";
                        phandle = <0x00000002>;
                };

        };

        cpu-map: {
                cluster0: {
                        core0: {
                                cpu = <0x00000001>;
                        };

                };

        };

};

soc: {
        #address-cells = <0x00000002>;
        #size-cells = <0x00000002>;
        compatible = "simple-bus";
        ranges;
        pmu: {
                compatible = "riscv,pmu";
        };

        rtc@101000: {
                interrupts = <0x0000000b>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x00101000 0x00000000 0x00001000>;
                compatible = "google,goldfish-rtc";
        };

        serial@10000000: {
                interrupts = <0x0000000a>;
                interrupt-parent = <0x00000003>;
                clock-frequency = "", "8@";
                reg = <0x00000000 0x10000000 0x00000000 0x00000100>;
                compatible = "ns16550a";
        };

        test@100000: {
                phandle = <0x00000004>;
                reg = <0x00000000 0x00100000 0x00000000 0x00001000>;
                compatible = "sifive,test1", "sifive,test0", "syscon";
        };

        pci@30000000: {
                interrupt-map-mask = <0x00001800 0x00000000 0x00000000 0x00000007>;
                interrupt-map = <0x00000000 0x00000000 0x00000000 0x00000001 0x00000003 0x00000020 0x00000000 0x00000000 0x00000000 0x00000002 0x00000003 0x00000021 0x00000000 0x00000000 0x00000000 0x00000003 0x00000003 0x00000022 0x00000000 0x00000000 0x00000000 0x00000004 0x00000003 0x00000023 0x00000800 0x00000000 0x00000000 0x00000001 0x00000003 0x00000021 0x00000800 0x00000000 0x00000000 0x00000002 0x00000003 0x00000022 0x00000800 0x00000000 0x00000000 0x00000003 0x00000003 0x00000023 0x00000800 0x00000000 0x00000000 0x00000004 0x00000003 0x00000020 0x00001000 0x00000000 0x00000000 0x00000001 0x00000003 0x00000022 0x00001000 0x00000000 0x00000000 0x00000002 0x00000003 0x00000023 0x00001000 0x00000000 0x00000000 0x00000003 0x00000003 0x00000020 0x00001000 0x00000000 0x00000000 0x00000004 0x00000003 0x00000021 0x00001800 0x00000000 0x00000000 0x00000001 0x00000003 0x00000023 0x00001800 0x00000000 0x00000000 0x00000002 0x00000003 0x00000020 0x00001800 0x00000000 0x00000000 0x00000003 0x00000003 0x00000021 0x00001800 0x00000000 0x00000000 0x00000004 0x00000003 0x00000022>;
                ranges = <0x01000000 0x00000000 0x00000000 0x00000000 0x03000000 0x00000000 0x00010000 0x02000000 0x00000000 0x40000000 0x00000000 0x40000000 0x00000000 0x40000000 0x03000000 0x00000004 0x00000000 0x00000004 0x00000000 0x00000004 0x00000000>;
                reg = <0x00000000 0x30000000 0x00000000 0x10000000>;
                dma-coherent;
                bus-range = <0x00000000 0x000000ff>;
                linux,pci-domain = <0x00000000>;
                device_type = "pci";
                compatible = "pci-host-ecam-generic";
                #size-cells = <0x00000002>;
                #interrupt-cells = <0x00000001>;
                #address-cells = <0x00000003>;
        };

        virtio_mmio@10008000: {
                interrupts = <0x00000008>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x10008000 0x00000000 0x00001000>;
                compatible = "virtio,mmio";
        };

        virtio_mmio@10007000: {
                interrupts = <0x00000007>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x10007000 0x00000000 0x00001000>;
                compatible = "virtio,mmio";
        };

        virtio_mmio@10006000: {
                interrupts = <0x00000006>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x10006000 0x00000000 0x00001000>;
                compatible = "virtio,mmio";
        };

        virtio_mmio@10005000: {
                interrupts = <0x00000005>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x10005000 0x00000000 0x00001000>;
                compatible = "virtio,mmio";
        };

        virtio_mmio@10004000: {
                interrupts = <0x00000004>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x10004000 0x00000000 0x00001000>;
                compatible = "virtio,mmio";
        };

        virtio_mmio@10003000: {
                interrupts = <0x00000003>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x10003000 0x00000000 0x00001000>;
                compatible = "virtio,mmio";
        };

        virtio_mmio@10002000: {
                interrupts = <0x00000002>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x10002000 0x00000000 0x00001000>;
                compatible = "virtio,mmio";
        };

        virtio_mmio@10001000: {
                interrupts = <0x00000001>;
                interrupt-parent = <0x00000003>;
                reg = <0x00000000 0x10001000 0x00000000 0x00001000>;
                compatible = "virtio,mmio";
        };

        plic@c000000: {
                phandle = <0x00000003>;
                riscv,ndev = <0x00000060>;
                reg = <0x00000000 0x0c000000 0x00000000 0x00600000>;
                interrupts-extended = <0x00000002 0xffffffff 0x00000002 0x00000009>;
                interrupt-controller;
                compatible = "sifive,plic-1.0.0", "riscv,plic0";
                #address-cells = <0x00000000>;
                #interrupt-cells = <0x00000001>;
        };

        clint@2000000: {
                interrupts-extended = <0x00000002 0x00000003 0x00000002 0x00000007>;
                reg = <0x00000000 0x02000000 0x00000000 0x00010000>;
                compatible = "sifive,clint0", "riscv,clint0";
        };

};

[INFO] arch/riscv64/kernel/irq.c:29: CSR_SIE: 0
[INFO] common/timer.c:74: ticks_per_sec: 10000000
[INFO] common/timer.c:75: current ticks: 20454919
[INFO] common/uapi/dispatch.c:25: sys_noop
Hello, world!
Timebase: 10000000
Start ticks: 20661165
End ticks: 30661167
Syscalls per second: 2754795
Setting callback...Starting fork():
Child pid: 2
Swapping to child...
Hello from child!
Doing swaps...
Swaps (both ways) per second: 788644
Doing ipc requests...
IPC requests per second: 565611
Doing memory allocations...
Checking shared memory
Shared memory ptr: 4194304
Shared memory size: 4096
Hello from the other side!
```

`qemu` should exit automatically after this. Note that some parts may take a while, be patient.
