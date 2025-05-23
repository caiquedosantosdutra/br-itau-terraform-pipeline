
resource "aws_instance" "ec2_instance_itau" {
  ami                         = "ami-06c8f2ec674c67112"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-09f35be1a6f0f024b"


  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "ec2-instance"
  }
}
