##########################
# IAM: Policies and Roles
##########################

resource "aws_iam_role" "iamrole" {
  name = "${var.name}-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Role policy
resource "aws_iam_role_policy" "iampolicy" {
  name = "${var.name}-policy"
  role = "${aws_iam_role.iamrole.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action" : ["ec2:*"],
      "Effect": "Allow",
      "Resource": ["*"]
    },
    {
      "Action": "route53:*",
      "Effect": "Allow",
      "Resource": ["*"]
    }
  ]
}
EOF
}

resource  "aws_iam_instance_profile" "iamprofile" {
 name = "${var.name}-profile"
 roles = ["${aws_iam_role.iamrole.name}"]
}
