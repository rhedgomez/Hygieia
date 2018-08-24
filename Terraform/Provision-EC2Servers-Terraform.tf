provider "aws" {
  access_key = "AKIAIFG4DXQRB3K4LU5Q"
  secret_key = "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"
  region     = "us-east-2"
}
resource "aws_security_group" "ssh_and_http" {
  name = "allow_ssh_and_http"
  description = "Allow SSH and HTTP traffic"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_master_server" {
  ami           = "ami-b0b7e3dc"
  instance_type = "t2.small"
  security_groups = ["${aws_security_group.ssh_and_http.name}"]
  key_name = "RhedsAWSPublickey"
  tags {
        Name = "jenkins_master_server"
        role = "jenkins_master_server"
       }

}

resource "aws_instance" "swarm-docker_server" {
  ami           = "ami-b0b7e3dc"
  instance_type = "t2.small"
  security_groups = ["${aws_security_group.ssh_and_http.name}"]
  key_name = "RhedsAWSPublickey"
  tags {
        Name = "swarm-docker_server"
        role = "swarm-docker_server"
       }

}

resource "aws_eip" "jenkins_master_server" {
	instance = "${aws_instance.jenkins_master_server.id}"    
	vpc = true
}
