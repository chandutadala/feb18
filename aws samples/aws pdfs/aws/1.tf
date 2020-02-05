resource aws_key_pair "myssh"
{
  key_name="terrafrmkey"
  public_key="${file("./mysshkey.pub")}"
}

resource aws_instance "myec2"
{
   ami="ami-0d773a3b7bb2bb1c1"
   instance_type = "t2.micro"
   key_name= "${aws_key_pair.myssh.key_name}"
}
resource aws_ebs_volume "vol"
{
   size=10
   type="gp2"
   availability_zone=
   "${aws_instance.myec2.availability_zone}" 
}
resource aws_volume_attachment "volatt"
{
  device_name = "/dev/sdf"
  volume_id   = "${aws_ebs_volume.vol.id}"
  instance_id = "${aws_instance.myec2.id}"
}
