variable "ip_haproxy" {
  type = string
  default = "187.3.223.136"
  description = "Passe aqui o IP do haproxy"
}
variable "subnet_priv" {
    type = map(string)
    default = { 
        "a" = "subnet-0341d478f8cd667a3"
        "b" = "subnet-066e5789ce7e65f06"
        "c" = "subnet-0a7b85eab03329d31"
        "priv" = "subnet-0cb1996a808f89e2f"
        
    }
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-0341d478f8cd667a3","subnet-0a7b85eab03329d31"]
}