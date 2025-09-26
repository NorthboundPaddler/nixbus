# NixBUS

 ![https://cdn-icons-png.flaticon.com/128/1068/1068580.png](https://cdn-icons-png.flaticon.com/128/1068/1068580.png)

An opinionated, minimal NixOS configuration for a **B**ack**U**p **S**erver (BUS).

## What this is

The server needs to be quick to spin up as a target for ZFS send over Tailscale.

Disk layout is expected to be a single drive using ZFS on root, and then another zfs pool for the bulk backup storage. 

## Commissioning a new BUS

A user needs to complete the following to get a new system up and running:
- [ ] Set the PC to turn on from AC power in the BIOS
- [ ] Set `busdriver` password
- [ ] Connect ethernet or use `nmtui` to connect wi-fi
- [ ] Authenticate to Tailscale with `tailscale login` and disable expiration on key in web UI
- [ ] Add SSH keys to `/etc/nixos/ssh/authorized_keys`

## REPO TODO
- [ ] Convert this to a flake
- [ ] Write docs for simple zfs on root commands and mirrored bulk pool
- [ ] Figure out Sanoid + Syncoid
- [ ] Integrate ZED to send alerts to NTFY
