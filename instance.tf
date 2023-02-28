
resource "aws_instance" "curvc-test" {
    ami = var.AMIS
    key_name = var.ami_key_pair_name
    instance_type = var.instance_type
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = ["${aws_security_group.webserversg.id}"]
    tags = {
      Name = "curvc-test-tag"
    }
} 