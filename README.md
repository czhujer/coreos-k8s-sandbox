
# coreOS + kubernetes playground

tested on centos 6 + kvm (libvirt)

## creating virtual machines

### manually

* over virt-install
* * docs https://www.greglangford.co.uk/installing-coreos-kvm-using-virt-install/ 

- create VM and boot instalator/live image
```
huhuserver-01 # virt-install --name coreos-c2-s1 --ram 2048 --disk pool=vm_storage,size=10,bus=virtio,sparse=false --network network=net-1,model=virtio --noautoconsole --vcpus 2 --graphics none --boot kernel=/var/lib/libvirt/images/coreos_production_pxe.vmlinuz,initrd=/var/lib/libvirt/images/coreos_production_pxe_image.cpio.gz,kernel_args="console=ttyS0 coreos.autologin=ttyS0" --os-type=linux --os-variant=virtio26
```

- login into console
```
huhuserver-01 # virsh console coreos-c2-s1
```

- deploy coreos with configuration
```
core@localhost ~ $ sudo coreos-install -d /dev/vda -i ignition-coreos-c2-s1.json
```

- edit guest over "virsh edit" (or undef guest and re-create with booting from disk)

- remove this lines
```
    <kernel>/var/lib/libvirt/images/coreos_production_pxe.vmlinuz</kernel>
    <initrd>/var/lib/libvirt/images/coreos_production_pxe_image.cpio.gz</initrd>
    <cmdline>console=ttyS0 coreos.autologin=ttyS0</cmdline>
```

- start or restart guest
```
huhuserver-01 # virsh shutdown coreos-c2-s1; virsh start core-s2-s1;
```

### with terraform

* install terrafowm (tested Terraform v0.11.13)

* add provider https://github.com/dmacvicar/terraform-provider-libvirt

* run terraform plan/apply

- not ready yet (some bugs with list NICs)

## deploy kubernetes

* over kubespray
* * https://github.com/kubernetes-sigs/kubespray

## test some workload

* run some apps over kubectl
