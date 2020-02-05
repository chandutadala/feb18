resource aws_iam_user "testuser"
{
 name="t_user1"
}
resource aws_iam_user "testuser1"
{
 name="t_user2"
}
resource aws_iam_user "testuser2"
{
 name="t_user3"
}


resource aws_iam_policy_attachment "att"
{
  name       = "test-attachment"
  users  =["t_user1","t_user2"]
  policy_arn="arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  depends_on = ["aws_iam_user.testuser1",
  "aws_iam_user.testuser","aws_iam_user.testuser2"]
}

resource "aws_iam_policy" "policy" 
{
name     = "test_policy"
policy= "${file("./1.json")}"
}