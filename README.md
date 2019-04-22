
# coreOS + kubernetes playground

tested on centos 6 + kvm (libvirt)

# creating virtual machines

## manually

* over virt-install
* * docs https://www.greglangford.co.uk/installing-coreos-kvm-using-virt-install/ 

```

```

## with terraform

* install terrafowm (tested Terraform v0.11.13)

* add provider https://github.com/dmacvicar/terraform-provider-libvirt

* run terraform plan/apply

- not ready yet (some bugs with list NICs)
