# ica0017

# Lab2
```yaml

Policy JSON:

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
```

# Lab3

url: http://ec2-13-49-240-124.eu-north-1.compute.amazonaws.com/

# Lab4

index URL: https://mlaane.s3.eu-north-1.amazonaws.com/index.html

error URL: https://mlaane.s3.eu-north-1.amazonaws.com/error.html