provider "aws" {
  region = "us-east-2"                         
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-0c55b159cbfafe1f0"       
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.sg.id]

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
    Name = "git-pipeline-tf-vm"
  }
}
