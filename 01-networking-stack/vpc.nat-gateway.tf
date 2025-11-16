resource "aws_nat_gateway" "this" {
    allocation_id = aws_eip.this.id
    subnet_id = element(aws_subnet.public, 0).id # Place NAT Gateway in the first public subnet - could be any of the two public subnets

    tags = { 
        Name = var.vpc.nat_gateway_name
    }

    depends_on = [ aws_internet_gateway.this ]
}