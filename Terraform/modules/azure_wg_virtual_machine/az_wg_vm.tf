resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

data "template_file" "users_data" {
  template = file("/home/runner/work/Az-k8s-Twitter_Bot-CICD_Pipeline/Az-k8s-Twitter_Bot-CICD_Pipeline/Templates/cloud.cfg")

  vars = {
    az_copy_sas = "https://${var.WG_Storage_Account_Name}.blob.core.windows.net/${var.WG_Storage_Container_Name}${var.sas_url_for_azcopy}"
    aks_pip = "${var.outboundip}"
  }
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.users_data.rendered
  }

  part {
    content_type = "text/cloud-config"
    content = yamlencode({ #Reason for why this is not in the main cloud.cfg: https://discuss.hashicorp.com/t/wrong-indent-with-multiline-content-to-cloud-init-write-files-content-directives/35011/2
      write_files = [
        {
          encoding    = "b64"
          content     = filebase64("/home/runner/work/Az-k8s-Twitter_Bot-CICD_Pipeline/Az-k8s-Twitter_Bot-CICD_Pipeline/Templates/client01.conf")
          path        = "/etc/wireguard/client01.conf"
          owner       = "root:root"
          permissions = "0777"
          defer       = true
        },
        {
          encoding    = "b64"
          content     = filebase64("/home/runner/work/Az-k8s-Twitter_Bot-CICD_Pipeline/Az-k8s-Twitter_Bot-CICD_Pipeline/Templates/wg0.conf")
          path        = "/etc/wireguard/wg0.conf"
          owner       = "root:root"
          permissions = "0777"
          defer       = true
        },
        {
          encoding    = "b64"
          content     = filebase64("/home/runner/work/Az-k8s-Twitter_Bot-CICD_Pipeline/Az-k8s-Twitter_Bot-CICD_Pipeline/Templates/config_wg.sh")
          path        = "/etc/wireguard/config_wg.sh"
          owner       = "root:root"
          permissions = "0777"
          defer       = true
        },
      ]
    })
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                            = "wireguardvpnserver"
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  size                            = "Standard_DS1_v2"
  admin_username                  = "adminAllen"
  allow_extension_operations      = false
  disable_password_authentication = true
  custom_data                     = data.template_cloudinit_config.config.rendered
  priority                        = "Spot"
  eviction_policy                 = "Deallocate"
  provision_vm_agent              = true

  network_interface_ids = [
    var.nic_id,
  ]

  additional_capabilities {
    hibernation_enabled = false
  }

  admin_ssh_key {
    username   = "adminAllen"
    public_key = tls_private_key.ssh_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
