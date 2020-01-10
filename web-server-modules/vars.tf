variable "aws_region" {
  description = "AWS region"
}

variable "name" {
  description = "Name of ASG"
}
variable "image_id" {
  description = "Image id for servers"
}


variable "instance_type" {
  description = "Type of EC2 instance used by ASG"
}

variable "min_size" {
  description = "minimum number of ec2 in ASG"
}

variable "max_size" {
  description = "maximum number of ec2 in ASG"
}

variable "server_port" {
  description = "port number of web server on it should listen on"
}

variable "elb_port" {
  description = "The port number of elb should listen on for requests"
}



