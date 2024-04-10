module "rds1" {
  source   = "../module/rds"
  username = "farelle"
  password = "hyvrane1234"


}
module "key" {
  source      = "../module/key-pair"
  region_name = "us-east-1"
  key_name    = "far-key"

}
module "security_group" {
  source = "../module/sg"
  ports = [
    { protocol = "tcp", port = 22, description = "open ssh port", cidr_blocks = ["0.0.0.0/0"] },
    { protocol = "tcp", port = 80, description = "open httpd port", cidr_blocks = ["0.0.0.0/0"] },
    { protocol = "tcp", port = 8080, description = "open the port of jenkins", cidr_blocks = ["0.0.0.0/0"] }


  ]
  tag_env  = "dev"
  tag_name = "dev-sg"

}
/*module "security_group_ssh" {
    source = "../module/sg"
    ingress_protocol = "tcp"
    ingress_description = "allow ssh"
    port_protocol = 22
  
}
*/
# variable "ports" {
#     default = [
#         {protocol = "tcp",port =22,description ="open ssh port",cidr_blocks =["0.0.0.0/0"]},
#         {protocol ="tcp",port =80,description ="open httpd port",cidr_blocks =["0.0.0.0/0"]},
#         {protocol ="tcp",port =8080,description ="open the port of jenkins",cidr_blocks =["0.0.0.0/0"]}


#     ]

#     }

