These are the config files for personal use.

## FSTAB
```bash
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> 				<dir> 		          <type> 	        <options>		                <dump> <pass>
UUID=cbc33525-9b92-4d48-8fa0-5b159ebd2b5d   /     		      ext4   	defaults 	  	      0 1
UUID=BABA-7361	                            /     		      vfat   	defaults 	  	      0 2
UUID=72D240EDD240B6DF		            /externalDrive 	      ntfs-3g defaults,uid=1000 	0 1
```

## Kernel Parameters
> i915.enable_dpcd_backlight=1 loglevel=3 quiet

## Boot Entry
```
title Arch Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux-fallback.img
options root="PARTUUID=0c6f7e68-bb4f-c34e-a04e-0e2ead63fe77" rw i915.enable_dpcd_backlight=1 nowatchdog pcie_aspm=force intel_pstate=force intel_idle.max_cstate=9 intel_iommu=on
```

## Boot Directory
```
/boot
├── EFI
│   ├── BOOT
│   │   └── BOOTX64.EFI
│   ├── Linux
│   └── systemd
│       └── systemd-bootx64.efi
├── initramfs-linux-fallback.img
├── initramfs-linux.img
├── intel-ucode.img
├── loader
│   ├── entries
│   │   └── archlinux.conf
│   ├── loader.conf
│   └── random-seed
├── System Volume Information
└── vmlinuz-linux
```
