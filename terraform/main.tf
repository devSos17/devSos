data "aws_ami" "distro" {
  most_recent = true

  name_regex = "al2023-ami-2023.*"


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.distro.id
  instance_type               = "t3a.micro"
  associate_public_ip_address = true
  key_name                    = "devSos"
}

resource "local_file" "hosts_cfg" {
  content = templatefile("../templates/hosts.tpl",
    {
      webserver = aws_instance.web.public_ip
    }
  )
  filename = "hosts.cfg"
}

