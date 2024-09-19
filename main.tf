module "admin" {
  source = "./modules/admin"
}
module "dns" {
  source = "./modules/dns"
}

module "lb" {
  source = "./modules/lb"
}

module "ldap" {
  source = "./modules/ldap"
}

module "vault" {
  source = "./modules/vault"
}
