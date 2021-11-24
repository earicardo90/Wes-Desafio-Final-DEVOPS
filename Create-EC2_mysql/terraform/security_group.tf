
resource "aws_security_group" "mysql" {
  name        = "wes_priv_mysql"
  description = "acessos inbound traffic"
  vpc_id = var.vpc_id 
  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null,
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    {
      description      = "Mysql from subnet"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = []
      security_groups  = ["var.sg_workers"]
      ipv6_cidr_blocks = null,
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = [],
      prefix_list_ids = null,
      security_groups: null,
      self: null,
      description: "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "wes_priv_mysql"
  }
}
