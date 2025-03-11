# locals {
#     name = "mycompany-standard"
# }

# resource "aws_vpc" "standard_vpc" {
#   cidr_block       = "10.10.0.0/16"
#   enable_dns_support   = true
#   enable_dns_hostnames = true

#   tags = {
#     Name = "${local.name}-vpc"
#   }
# }

# resource "aws_subnet" "public_subnet_1a" {
#   vpc_id            = aws_vpc.standard_vpc.id
#   cidr_block        = "10.10.0.0/22"
#   availability_zone = "us-west-2a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "${local.name}-subnet-public1-us-west-2a"
#   }
# }

# resource "aws_subnet" "public_subnet_1b" {
#   vpc_id            = aws_vpc.standard_vpc.id
#   cidr_block        = "10.10.4.0/22"
#   availability_zone = "us-west-2b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "${local.name}-subnet-public2-us-west-2b"
#   }
# }

# resource "aws_subnet" "public_subnet_1c" {
#   vpc_id            = aws_vpc.standard_vpc.id
#   cidr_block        = "10.10.8.0/22"
#   availability_zone = "us-west-2c"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "${local.name}-subnet-public3-us-west-2c"
#   }
# }

# resource "aws_subnet" "private_subnet_1a" {
#   vpc_id            = aws_vpc.standard_vpc.id
#   cidr_block        = "10.10.100.0/22"
#   availability_zone = "us-west-2a"

#   tags = {
#     Name = "${local.name}-subnet-private1-us-west-2a"
#   }
# }

# resource "aws_subnet" "private_subnet_1b" {
#   vpc_id            = aws_vpc.standard_vpc.id
#   cidr_block        = "10.10.104.0/22"
#   availability_zone = "us-west-2b"

#   tags = {
#     Name = "${local.name}-subnet-private2-us-west-2b"
#   }
# }

# resource "aws_subnet" "private_subnet_1c" {
#   vpc_id            = aws_vpc.standard_vpc.id
#   cidr_block        = "10.10.108.0/22"
#   availability_zone = "us-west-2c"

#   tags = {
#     Name = "${local.name}-subnet-private3-us-west-2c"
#   }
# }

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.standard_vpc.id

#   tags = {
#     Name = "${local.name}-igw"
#   }
# }

# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.standard_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "${local.name}-rtb-public"
#   }
# }

# resource "aws_route_table_association" "public_rt_assoc_1a" {
#   subnet_id      = aws_subnet.public_subnet_1a.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table_association" "public_rt_assoc_1b" {
#   subnet_id      = aws_subnet.public_subnet_1b.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table_association" "public_rt_assoc_1c" {
#   subnet_id      = aws_subnet.public_subnet_1c.id
#   route_table_id = aws_route_table.public_rt.id
# }

# resource "aws_route_table" "private_rt_1a" {
#   vpc_id = aws_vpc.standard_vpc.id

#   tags = {
#     Name = "${local.name}-rtb-private1-us-west-2a"
#   }
# }

# resource "aws_route_table" "private_rt_1b" {
#   vpc_id = aws_vpc.standard_vpc.id

#   tags = {
#     Name = "${local.name}-rtb-private2-us-west-2b"
#   }
# }

# resource "aws_route_table" "private_rt_1c" {
#   vpc_id = aws_vpc.standard_vpc.id

#   tags = {
#     Name = "${local.name}-rtb-private3-us-west-2c"
#   }
# }

# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public_subnet_1a.id

#   tags = {
#     Name = "${local.name}-nat-public1-us-west-2a"
#   }
# }

# resource "aws_eip" "nat" {
# }

# resource "aws_route" "private_rt_1a_nat" {
#   route_table_id         = aws_route_table.private_rt_1a.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat.id
# }

# resource "aws_route" "private_rt_1b_nat" {
#   route_table_id         = aws_route_table.private_rt_1b.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat.id
# }

# resource "aws_route" "private_rt_1c_nat" {
#   route_table_id         = aws_route_table.private_rt_1c.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat.id
# }

# resource "aws_route_table_association" "private_rt_assoc_1a" {
#   subnet_id      = aws_subnet.private_subnet_1a.id
#   route_table_id = aws_route_table.private_rt_1a.id
# }

# resource "aws_route_table_association" "private_rt_assoc_1b" {
#   subnet_id      = aws_subnet.private_subnet_1b.id
#   route_table_id = aws_route_table.private_rt_1b.id
# }

# resource "aws_route_table_association" "private_rt_assoc_1c" {
#   subnet_id      = aws_subnet.private_subnet_1c.id
#   route_table_id = aws_route_table.private_rt_1c.id
# }
