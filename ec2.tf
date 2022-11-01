# Create EC2 Instance
resource "aws_instance" "linux-server" {
  ami                         = data.aws_ami.ubuntu-linux-2204.id
  instance_type               = var.linux_instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.aws-ubuntu-sg.id]
  associate_public_ip_address = var.linux_associate_public_ip_address
  source_dest_check           = false
  key_name                    = aws_key_pair.key_pair.key_name
  user_data                   = file("aws-user-data.sh")
  
  # root disk
  root_block_device {
    volume_size           = var.linux_root_volume_size
    volume_type           = var.linux_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }
  
  tags = {
    Name = "ubuntu-play-vm"
  }
}

# Create Elastic IP for the EC2 instance
resource "aws_eip" "ubuntu-eip" {
  vpc  = true
  tags = {
    Name = "ubuntu-eip"
  }
}
# Associate Elastic IP to Linux Server
resource "aws_eip_association" "ubuntu-eip-association" {
  instance_id   = aws_instance.linux-server.id
  allocation_id = aws_eip.ubuntu-eip.id
}
