resource "aws_instance" "test" {
  count             = 2
  ami               = "ami-0a017d8ceb274537d"
  instance_type     = "t3.micro"
  tags = {
    Name = "instance-${count.index}" //gives the instances name i.e. instance 1 or instance 2
  }
}

output "public_ip" {
  value = aws_instance.test.*.public_ip
}

// [0] if you want the the first instance and [1] if you want the second instance created.
//value = aws_instance.test[1].public_ip


//if you want both of the instances created (since count = 2)
//value = aws_instance.test.*.public_ip