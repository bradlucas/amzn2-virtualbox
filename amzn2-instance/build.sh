#!/bin/bash

rm -f init.iso

# For a non-MAC use the application `genisoimage`
hdiutil makehybrid -o init.iso -hfs -joliet -iso -default-volume-name cidata config

cp ../BACKUP/amzn2-virtualbox-2.0.20181024-x86_64.xfs.gpt.vdi  .

vboxmanage internalcommands sethduuid amzn2-virtualbox-2.0.20181024-x86_64.xfs.gpt.vdi


