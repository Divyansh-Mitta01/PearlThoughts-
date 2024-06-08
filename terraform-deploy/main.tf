provider "aws" {
  region = "us-west-2" # Change to your preferred region
}

resource "aws_instance" "node_app" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = var.key_name

  tags = {
    Name = "NodeAppInstance"
  }

  provisioner "file" {
    source      = "../my-node-app"
    destination = "/home/ec2-user/my-node-app"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -",
      "sudo yum install -y nodejs",
      "cd /home/ec2-user/my-node-app",
      "npm install",
      "node index.js &"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}

output "instance_public_ip" {
  value = aws_instance.node_app.public_ip
}
