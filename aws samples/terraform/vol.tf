resource aws_ebs_volume "vol"
{
 availability_zone ="ap-south-1a"
 size=12
 type="gp2"
}
resource aws_instance "myec2"
{
   ami="ami-0d773a3b7bb2bb1c1"
   instance_type="t2.micro"
}
/*resource "aws_volume_attachment" "ebs_att"
{
   volume_id="${aws_ebs_volume.vol.id}"
   instance_id="${aws_instance.myec2.id}"
   device_name="/dev/sdp"
}*/
resource aws_eip "myeip"
{
   instance="${aws_instance.myec2.id}"
}



