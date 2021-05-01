# Setting up the host 

## Enabling Intel IOMMU
> intel_iommu=on

## Showing the IOMMU Groups
```
#!/bin/bash
shopt -s nullglob
for g in `find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V`; do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
            echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;
```

### Output IOMMU Groups
```
IOMMU Group 0:
    00:00.0 Host bridge [0600]: Intel Corporation 8th Gen Core Processor Host Bridge/DRAM Registers [8086:3ec4] (rev 07)
IOMMU Group 1:
    00:01.0 PCI bridge [0604]: Intel Corporation 6th-9th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 07)
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP106M [GeForce GTX 1060 Mobile] [10de:1c20] (rev a1)
    01:00.1 Audio device [0403]: NVIDIA Corporation GP106 High Definition Audio Controller [10de:10f1] (rev a1)
IOMMU Group 2:
    00:02.0 VGA compatible controller [0300]: Intel Corporation UHD Graphics 630 (Mobile) [8086:3e9b]
IOMMU Group 3:
    00:08.0 System peripheral [0880]: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model [8086:1911]
IOMMU Group 4:
    00:12.0 Signal processing controller [1180]: Intel Corporation Cannon Lake PCH Thermal Controller [8086:a379] (rev 10)
IOMMU Group 5:
    00:14.0 USB controller [0c03]: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host Controller [8086:a36d] (rev 10)
    00:14.2 RAM memory [0500]: Intel Corporation Cannon Lake PCH Shared SRAM [8086:a36f] (rev 10)
IOMMU Group 6:
    00:14.3 Network controller [0280]: Intel Corporation Wireless-AC 9560 [Jefferson Peak] [8086:a370] (rev 10)
IOMMU Group 7:
    00:16.0 Communication controller [0780]: Intel Corporation Cannon Lake PCH HECI Controller [8086:a360] (rev 10)
IOMMU Group 8:
    00:17.0 SATA controller [0106]: Intel Corporation Cannon Lake Mobile PCH SATA AHCI Controller [8086:a353] (rev 10)
IOMMU Group 9:
    00:1d.0 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #9 [8086:a330] (rev f0)
IOMMU Group 10:
    00:1d.6 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #15 [8086:a336] (rev f0)
IOMMU Group 11:
    00:1f.0 ISA bridge [0601]: Intel Corporation HM470 Chipset LPC/eSPI Controller [8086:a30d] (rev 10)
    00:1f.3 Audio device [0403]: Intel Corporation Cannon Lake PCH cAVS [8086:a348] (rev 10)
    00:1f.4 SMBus [0c05]: Intel Corporation Cannon Lake PCH SMBus Controller [8086:a323] (rev 10)
    00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH SPI Controller [8086:a324] (rev 10)
IOMMU Group 12:
    03:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTL8411B PCI Express Card Reader [10ec:5287] (rev 01)
    03:00.1 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 12)
```

### Output lspci
```
00:00.0 Host bridge [0600]: Intel Corporation 8th Gen Core Processor Host Bridge/DRAM Registers [8086:3ec4] (rev 07)
	DeviceName: Onboard - Other
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: skl_uncore
00:01.0 PCI bridge [0604]: Intel Corporation 6th-9th Gen Core Processor PCIe Controller (x16) [8086:1901] (rev 07)
	Kernel driver in use: pcieport
00:02.0 VGA compatible controller [0300]: Intel Corporation UHD Graphics 630 (Mobile) [8086:3e9b]
	DeviceName: Onboard - Video
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: i915
	Kernel modules: i915
00:08.0 System peripheral [0880]: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model [8086:1911]
	DeviceName: Onboard - Other
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
00:12.0 Signal processing controller [1180]: Intel Corporation Cannon Lake PCH Thermal Controller [8086:a379] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: intel_pch_thermal
	Kernel modules: intel_pch_thermal
00:14.0 USB controller [0c03]: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host Controller [8086:a36d] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci
00:14.2 RAM memory [0500]: Intel Corporation Cannon Lake PCH Shared SRAM [8086:a36f] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: Intel Corporation Device [8086:7270]
00:14.3 Network controller [0280]: Intel Corporation Wireless-AC 9560 [Jefferson Peak] [8086:a370] (rev 10)
	DeviceName: Onboard - Ethernet
	Subsystem: Intel Corporation Device [8086:02a4]
	Kernel driver in use: iwlwifi
	Kernel modules: iwlwifi
00:16.0 Communication controller [0780]: Intel Corporation Cannon Lake PCH HECI Controller [8086:a360] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: mei_me
	Kernel modules: mei_me
00:17.0 SATA controller [0106]: Intel Corporation Cannon Lake Mobile PCH SATA AHCI Controller [8086:a353] (rev 10)
	DeviceName: Onboard - SATA
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: ahci
00:1d.0 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #9 [8086:a330] (rev f0)
	Kernel driver in use: pcieport
00:1d.6 PCI bridge [0604]: Intel Corporation Cannon Lake PCH PCI Express Root Port #15 [8086:a336] (rev f0)
	Kernel driver in use: pcieport
00:1f.0 ISA bridge [0601]: Intel Corporation HM470 Chipset LPC/eSPI Controller [8086:a30d] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
00:1f.3 Audio device [0403]: Intel Corporation Cannon Lake PCH cAVS [8086:a348] (rev 10)
	DeviceName: Onboard - Sound
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel, snd_soc_skl, snd_sof_pci
00:1f.4 SMBus [0c05]: Intel Corporation Cannon Lake PCH SMBus Controller [8086:a323] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801
00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH SPI Controller [8086:a324] (rev 10)
	DeviceName: Onboard - Other
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP106M [GeForce GTX 1060 Mobile] [10de:1c20] (rev a1)
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: nvidia
	Kernel modules: nouveau, nvidia_drm, nvidia
01:00.1 Audio device [0403]: NVIDIA Corporation GP106 High Definition Audio Controller [10de:10f1] (rev a1)
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel
03:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTL8411B PCI Express Card Reader [10ec:5287] (rev 01)
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: rtsx_pci
	Kernel modules: rtsx_pci
03:00.1 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 12)
	Subsystem: CLEVO/KAPOK Computer Device [1558:8500]
	Kernel driver in use: r8169
	Kernel modules: r8169
```

## Specify vifo-pci IDs
Add these changes to the kernel parameters
> vfio-pci.ids=10de:1c20,10de:10f1

## Loading vifo-pci early
Modify and regenerate initramfs.
```
/etc/mkinitcpio.conf

MODULES=(... vfio_pci vfio vfio_iommu_type1 vfio_virqfd ...)

HOOKS=(... modconf ...)
```

## Verifying that configuration Works
> dmesg | grep -i vfio

If the devices are not in dmseg output
> lspci -nnk -d "vfio-pci.id"

# Setting up OVMF-based Guest VM
```bash
# Requirements
qemu, libvirt, edk2-ovmf, and virt-manager

# Network Connection
iptables-nft and dnsmasq 
```
