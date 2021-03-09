resource "aws_iam_group" "mlaane" {
  name = "mlaane"
}

resource "aws_iam_user" "mlaane" {
  name = "mlaane"
}

resource "aws_iam_group_membership" "mlaane" {
  name = "mlaane_group_membership"

  users = [
    aws_iam_user.mlaane.name,
  ]

  group = aws_iam_group.mlaane.name
}

resource "aws_iam_policy" "mlaane" {
  name        = "mlaane_ec2"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:RebootInstances",
                "ec2:DescribeInstances",
                "ec2:TerminateInstances",
                "ec2:StartInstances",
                "ec2:MonitorInstances",
                "ec2:CreateSecurityGroup",
                "ec2:DeleteSecurityGroup",
                "ec2:RunInstances",
                "ec2:StopInstances"
            ],
            "Resource": "*",
            "Condition": {
                "ForAllValues:StringEqualsIfExists": {
                    "aws:username": "mlaane"
                }
            }
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeSecurityGroups"
            ],
            "Resource": "*"
        }
    ]
    
  })
}

resource "aws_iam_policy_attachment" "mlaane-attach" {
  name       = "mlaane-attachment"
  groups     = [aws_iam_group.mlaane.name]
  policy_arn = aws_iam_policy.mlaane.arn
}

data "aws_iam_policy_document" "mlaane_s3" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    resources = [
      "arn:aws:s3:::mlaane/*"
    ]
  }
}
