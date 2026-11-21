# Dell Inspiron 5491 2-in-1 validation checklist

No hardware test has been performed by the build environment. Complete these tests on the actual laptop from USB and, for Android, after installation.

## Live USB checks
- [ ] Boot in UEFI mode; confirm desktop appears without installing.
- [ ] Wi-Fi: connect, browse, reconnect after suspend/resume.
- [ ] Touchscreen: tap, drag, two-finger scroll, on-screen keyboard.
- [ ] Convertible/tablet mode: fold screen; verify keyboard/trackpad behavior and orientation.
- [ ] Audio, brightness, webcam, Bluetooth, sleep/wake.
- [ ] Check `free -h` after 5 minutes idle; run `scripts/measure-ram.sh`.

## Installed-system checks (required for Android)
Waydroid's own project notes that it does not work in live mode. Install Fusion OS to a spare partition only after backup, then run `scripts/install-android-after-install.sh`.
- [ ] Check binder kernel support and Waydroid initialization.
- [ ] Test an x86_64-compatible APK.
- [ ] Investigate a legitimate GAPPS image; Play Store is not guaranteed and may require Google certification.
- [ ] Compare idle RAM, Waydroid stopped, Waydroid running, and app running.

## Wine checks
- [ ] Run `winecfg`.
- [ ] Test only the specific Windows applications you need; compatibility varies.
- [ ] Measure RAM with Wine closed and while an app runs.

## Acceptance targets
- Idle RAM under 700 MB is a goal, not a promise. Record actual measurements after boot.
- No install/partition action during the USB trial.
