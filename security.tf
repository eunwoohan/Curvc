data "aws_ip_ranges" "korean_ec2" {
  regions  = ["ap-northeast-2"]
  services = ["ec2"]
}


resource "aws_security_group" "webserversg" {
  name = "test_curvc_vpc-allow_all"
  description = "Allow all inbound traffic"
  vpc_id = aws_vpc.test_curvc_vpc.id
}

resource "aws_security_group_rule" "websg_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserversg.id
  description       = "ssh"
}
resource "aws_security_group_rule" "websg_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserversg.id
  description       = "http"
}

resource "aws_security_group_rule" "websg_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webserversg.id
  description       = "outbound"
}