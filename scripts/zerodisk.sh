#!/bin/bash
set -e
set -x

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M || :
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted
sync