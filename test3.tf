provider "aws" {
  access_key = "AKIA53OV5HT2SZLJOOX6"
  secret_key = "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"
  region     = "ap-south-1"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.test.id}"
  allocation_id = "${aws_eip.example.id}"
}

resource "aws_instance" "test" {
  ami           = "ami-02913db388613c3e1"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
  }
}

resource "aws_eip" "example" {
  vpc = true
  }

output "ip" {
  value = aws_eip.example.public_ip
}
