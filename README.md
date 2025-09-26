# nixbus
A opinionated, minimal NixOS configuration for a BackUp Server (BUS).

The server needs to be quick to spin up as a target for ZFS send over Tailscale.

Disk layout is expected to be a single drive using ZFS on root, and then another zfs pool for the bulk backup storage. 

A user needs to complete the following to commission a new system:
- [ ] Set the PC to turn on from AC power in the BIOS
- [ ] Set `busdriver` password
- [ ] Connect ethernet or use `nmtui` to connect wi-fi
- [ ] Authenticate to Tailscale with `tailscale login`
- [ ] Add SSH keys to `/etc/nixos/ssh/authorized_keys`
