# amzn2-virtualbox

This repository contains the setup files needed to build a VirtualBox VM using an Amazon Linux 2 VDI file.

## Preliminary Steps
### 1. Download the Amazon Linux 2 VDI file

The Amazon VDI file is available at [https://cdn.amazonlinux.com/os-images/2.0.20181024/virtualbox/](https://cdn.amazonlinux.com/os-images/2.0.20181024/virtualbox/). Download the vdi file and save it in the `BACKUP` directory.

### 2. Decide about IP assignment

If you want to allow your VM to obtain an IP via DHCP just use the included `meta-data` file as is. If you have a specific IP to assign see the commented out example in the `meta-data` file.

### 3. Do you want to support a password-less ssh login?

If so, edit the `config/user-data` file. Uncomment the `ssh_authorized_keys` section and add your public key.

```
ssh_authorized_keys:
  - <enter your public key here
```

### 4. Run the build.sh script

This will create the `init.iso` boot image which you'll need when you create your VM.


## Creating your VirtualBox VM

### Name and operating system

- Name
  - amzn2-virtualbox
- Type
  - Linux
- Version
  - Linux 2.6 / 3.x / 4.x (64-bit)

#### Memory size

- 8 gig ram
- 8192 MB

#### Hard disk
- Use an existing virtual hard disk file
- Select
  - amzn2-virtualbox-2.0.20181024-x86_64.xfs.gpt.vdi


### Configure Virtual Machine

To configure the Virtual Machine in the left pan and then click on Settings.

#### Storage

In this section we are going to attach the `init.iso` file created above so it will be read when the VM starts.


- Select 'Controller: SATA' in left pane
- Click on Add button (third from left in the bottom of the left pane)
- Select 'Add Optical Drive'
- Choose disk
- Then select the init.iso file created above

#### Network

Set the Network to use the `Bridged aadapter`.

- Adapter 1
- Attached to: Bridged Adapter


## Running your VM

Notice that your `ec2-user` has a login password of `password`. This was setup in the `user-data` file. You can change this if you wish.

If you setup your ssh key you should also be able to ssh into your VM without a password.

