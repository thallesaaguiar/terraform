resource "aws_instance" "server" {
  count = local.instance_number <= 0 ? 0 : local.instance_number

  ami           = var.instance_ami
  instance_type = lookup(var.instance_type, vai.env)


  tags = merge(
    local.common_tags,

    {
    Name = "Curso AWS com Terraform"
    Env  = formt("%s", var.env)
    Name = formt("Instance %d", count.index +1)
    }
  
  )
}
