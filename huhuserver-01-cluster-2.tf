# docs
#https://github.com/dmacvicar/terraform-provider-libvirt
#https://computingforgeeks.com/how-to-provision-vms-on-kvm-with-terraform/

provider "libvirt" {
  alias = "huhuserver-01"
  uri   = "qemu+ssh://root@192.168.10.241/system"
}

resource "libvirt_volume" "coreos-c2-s1" {
  name = "coreos-c1-s1.qcow2"
  pool = "vm_storage"
  #source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  #source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
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
