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

// resource "libvirt_network" "net-1" {
//   name = "net-1"
// }

# Define KVM domain to create
resource "libvirt_domain" "coreos-c2-s1" {
  name   = "coreos-c2-s1"
  memory = "2048"
  vcpu   = 2

  network_interface {
    #network_id = "${libvirt_network.net-1.id}"
    network_name = "net-1"
  }

  disk {
    file = "${libvirt_volume.coreos-c2-s1-disk0.id}"
    // scsi      = true
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  // graphics {
  //   type = "none"
  // }
}
