data "aws_subnets" "private" {
    filter {
        name = "map-public-ip-on-launch"
        values = [false]
    }

    filter {
        name = "tag:Project"
        values = ["workshop-2", "workshop-dvn"]
    }

    filter {
        name = "tag:Environment"
        values = ["prod"]
    }
}