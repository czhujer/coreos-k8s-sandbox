# docs
#https://github.com/dmacvicar/terraform-provider-libvirt
#https://computingforgeeks.com/how-to-provision-vms-on-kvm-with-terraform/
# for coreos
# https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/examples/coreos/main.tf
# https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/examples/coreos/ignition.tf

# debug virsh -c qemu+ssh://root@192.168.10.241/system list
provider "libvirt" {
#  alias = "huhuserver-01"
  uri   = "qemu+ssh://root@192.168.10.241/system"
}

resource "libvirt_volume" "coreos-c2-s1-disk0" {
  name = "coreos-c2-s1-disk0.img"
  pool = "vm_storage"
  format = "raw"
  size    = "1073741824"
}

# Define KVM domain to create
# resource "libvirt_domain" "db1" {
#   name   = "db1"
#   memory = "1024"
#   vcpu   = 1

#   network_interface {
#     network_name = "default"
#   }

#   disk {
#     volume_id = "${libvirt_volume.centos7-qcow2.id}"
#   }

#   console {
#     type = "pty"
#     target_type = "serial"
#     target_port = "0"
#   }

#   graphics {
#     type = "spice"
#     listen_type = "address"
#     autoport = true
#   }
# }
