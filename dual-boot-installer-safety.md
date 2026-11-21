# Graphical installer and Windows dual-boot safety

The intended installer is Calamares, but this prototype does not yet contain a configured or validated Calamares installation flow.

Before an installer is enabled:
- Configure and validate Calamares modules for Debian 13.
- Offer manual partition selection and make it the safe default.
- Do not offer an unattended erase-disk path.
- Verify UEFI installation and EFI System Partition handling.
- Preserve the existing Windows Boot Manager entry and never format the Windows EFI System Partition.
- Require explicit confirmation before formatting any partition.
- Test on a disposable disk or virtual machine containing a Windows installation.
- Verify recovery and boot-repair procedures.

**Current status:** Calamares is only included as a development package. The live-build script explicitly disables Debian Installer. Do not install this prototype; use the live session only. Package inclusion alone is not a working installer.
