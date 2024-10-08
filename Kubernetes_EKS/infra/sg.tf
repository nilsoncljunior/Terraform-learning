resource "aws_security_group" "ssh_cluster" {
  name        = "ssh_cluster"
  description = "ssh_cluster"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "ssh_cluster_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh_cluster.id
}

resource "aws_security_group_rule" "ssh_cluster_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh_cluster.id
}

# resource "aws_security_group" "private" {
#   name        = "private-ecs"
#   description = "private-ecs"
#   vpc_id      = module.vpc.vpc_id
# }

# resource "aws_security_group_rule" "ingress-ecs" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   source_security_group_id = aws_security_group.alb.id
#   security_group_id = aws_security_group.private.id
# }

# resource "aws_security_group_rule" "egress-ecs" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.private.id
#}