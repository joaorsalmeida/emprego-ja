# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do 
	c = Company.create
	c.fantasy_name = "Empresa modelo"
	c.cnpj = 12345677
	c.email = "vitor@cdmil.com"
	c.phone = 11992094490
	c.url = "www.portaldabelleza.com.br"
	c.save
end