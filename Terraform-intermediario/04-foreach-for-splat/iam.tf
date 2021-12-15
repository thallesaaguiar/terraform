resource "aws_iam_user" "the-accounts" {
  for_each = toset(["Todd", "James", "Alice", "Dottie"])
  name     = each.key # note: each.key and each.value são os mesmos para o conjunto
}