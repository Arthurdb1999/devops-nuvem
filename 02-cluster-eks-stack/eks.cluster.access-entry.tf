resource "aws_eks_access_entry" "this" {
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = var.assume_role.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "this" {
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = aws_eks_access_entry.this.principal_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
