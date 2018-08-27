provider "aws" {
  access_key = "TESfdsfsdAKIAID3TESfdsfsdAKIAID3Efadsfasdfsf3AK3BUN4PCWAa"
  secret_key = "adsfsDfdgfdgdfgfdj4+jadsfasfsa1m//fVq2CLdK1X7VSnBb99hIGSgkWAIv3TF"
  region     = "us-east-1"
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

  ingress {
      from_port = 3000
      to_port = 3000
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

resource "aws_instance" "jenkins_master_server_centos" {
  ami           = "ami-4bf3d731"
  instance_type = "t2.small"
  security_groups = ["${aws_security_group.ssh_and_http.name}"]
  key_name = "RhedsAWSPublickey"
  tags {
        Name = "jenkins_master_server_centos"
        role = "jenkins_master_server_centos"
       }

}

resource "aws_instance" "swarm_docker_server_centos" {
  ami           = "ami-4bf3d731"
  instance_type = "t2.small"
  security_groups = ["${aws_security_group.ssh_and_http.name}"]
  key_name = "RhedsAWSPublickey"
  tags {
        Name = "swarm_docker_server_centos"
        role = "swarm-docker_server"
       }

}

resource "aws_eip" "jenkins_master_server_centos" {
	instance = "${aws_instance.jenkins_master_server_centos.id}"
	vpc = true
}
