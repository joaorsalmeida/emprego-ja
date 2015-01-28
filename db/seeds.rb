# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do 
	c = JobPosition.create
	c.title = "Empresa modelo"
	c.description = "descrição"
	c.location = "zona sul"
	c.expiration_date = 120114
	c.job_status = "Ativa"
	c.save
end

10.times do
	c = Company.new
	c.fantasy_name = "pre#{Time.now}"
	c.cnpj = 12321232233223
	c.url = "diego.com"
	c.email = "diego@diego.com"
	c.phone = 12322343
	c.save
end