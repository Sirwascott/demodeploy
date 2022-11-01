# Define the security group for the Linux server
resource "aws_security_group" "aws-ubuntu-sg" {
  name        = "ubuntu-sg"
  description = "Allow incoming traffic to the ubuntu EC2 Instance"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["73.102.139.162/32","98.124.192.207/32"]
    description = "Allow incoming HTTP connections"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["73.102.139.162/32","98.124.192.207/32"]
    description = "Allow incoming SSH connections"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
