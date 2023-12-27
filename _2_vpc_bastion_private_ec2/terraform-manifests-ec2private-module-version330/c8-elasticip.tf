# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2_public, module.vpc]
  instance   = module.ec2_public.id
  domain     = "vpc"
  tags = merge(
    local.common_tags,
    { Name = "bastion_eip" }
  )
  ## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  provisioner "local-exec" {
    command     = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when        = destroy
    #on_failure = continue
  }
}

output "bastion_eip" {
  description = "This EIP gets assigned to Bastion host, so the public_id before this is reassigned with this."
  value = aws_eip.bastion_eip.public_ip
}
