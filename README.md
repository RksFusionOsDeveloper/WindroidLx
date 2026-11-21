# Fusion OS build kit — prototype v0.4

A starter project for a lightweight Debian 13 (trixie) amd64 live USB, intended for testing on a Dell Inspiron 5491 2-in-1.

## Current build scope
- Debian 13 live-build configuration and XFCE desktop.
- NetworkManager and firmware packages.
- Wine/Wine64 for Windows application compatibility (compatibility varies by application).
- Calamares package is present as an installer development dependency only. A tested Calamares configuration and safe Windows-preserving dual-boot workflow are NOT included yet; do not launch an installer or install this prototype.
- Post-install helper to install Waydroid from Debian 13 backports.
- RAM measurement script and laptop hardware test checklist.
- Build-host preflight checker.

## Android / Play Store limitation
Waydroid requires an installed Linux system and is not enabled in the live USB session. Google Play Store is not bundled. A suitable GAPPS-enabled image and Google device certification may be required; Play Store availability is not guaranteed.

## Build the live ISO
Use a Debian 13 amd64 build machine with internet access and several GB of free disk space:
```bash
sudo apt update
sudo apt install -y live-build debootstrap xorriso squashfs-tools
./scripts/build-preflight.sh
sudo ./build.sh
```
The build script intentionally creates a live image and does not enable Debian Installer. The resulting ISO has not been built or tested in this environment.

## Installer roadmap and safety
The graphical installer is the next development milestone. Calamares is only staged as a package; its module configuration, manual partition flow, UEFI/EFI handling, Windows Boot Manager preservation, and destructive-action safeguards must be implemented and tested before enabling installation.

For now, boot the USB and choose the live session. Do not install this prototype. Before any future installation, back up Windows and personal files. Never choose erase-disk or automatic partitioning when preserving Windows.

See `docs/dual-boot-installer-safety.md` and `docs/hardware-test-checklist.md`.


## Build without installing Debian on your Dell (GitHub Actions)
The `.github/workflows/build-iso.yml` workflow can build the live ISO on a GitHub-hosted Ubuntu runner. You do not need to install Debian or Linux locally.

1. Create a GitHub repository (a public repository is simplest for free Actions usage).
2. Upload the **contents** of this build-kit folder to the repository root, including the hidden `.github` folder.
3. Open the repository's **Actions** tab and enable workflows if GitHub asks.
4. Select **Build Fusion OS ISO** and choose **Run workflow**.
5. Wait for the job to finish. If successful, open the run and download the `fusion-os-live-iso` artifact.

The workflow has not yet been run against GitHub, so successful compilation is not guaranteed. Check the build log if it fails. GitHub-hosted runners are temporary build machines; this does not modify your Dell's Windows installation.

This workflow produces the live-test ISO only. It does not make the unfinished Calamares dual-boot installer safe or functional.
