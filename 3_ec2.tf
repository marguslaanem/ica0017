resource "aws_instance" "myweb" {
  ami           = "ami-02a6bfdcf8224bd77"
  instance_type = "t3.micro"
  key_name = "Margus.Mbp"
  iam_instance_profile = "S3_Access"

  user_data = <<-EOF
                #!/bin/bash
                sudo yum -y update
                sudo yum -y install httpd
                echo "<h1>mlaane</h1>" | sudo tee /var/www/html/index.html
                echo "<h1>Error</h1>" | sudo tee /var/www/html/error.html
                sudo service httpd start
                sudo systemctl enable httpd
                aws s3 sync /var/www/html/ s3://mlaane
                EOF

  tags = {
    User = "mlaane"
  }
}

resource "aws_security_group" "myweb-sg" {
  name = "myweb-sg"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.myweb-sg.id
  network_interface_id = aws_instance.myweb.primary_network_interface_id
}

resource "aws_ami_from_instance" "mlaane-ami" {
  name               = "mlaane-ami"
  source_instance_id = aws_instance.myweb.id

  tags = {
    User = "mlaane"
  }

}