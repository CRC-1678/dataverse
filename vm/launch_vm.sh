#!/bin/bash

#lxc launch images:archlinux/desktop-gnome archlinux --vm -c security.secureboot=false -c limits.cpu=2 -c limits.memory=8GiB --console=vga

lxc launch images:rockylinux/9 rocky-dataverse --vm -c limits.cpu=2 -c limits.memory=8GiB

#list all 
#lxc list

# info
#lxc info rocky-dataverse

# stop
# lxc stop rocky-dataverse

# delete
#lxc delete rocky-dataverse
#lxc config show rocky-dataverse #check configuration
#lxc exec rocky-dataverse -- free -m #check used memory of vm
#lxc exec rocky-dataverse -- nproc #check processes
#lxc exec rocky-dataverse -- df -h #check disk usage
#lxc config device override rocky-dataverse root size=30GiB; lxc restart rocky-dataverse #change disk size on the go 
