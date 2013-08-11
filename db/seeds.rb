# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
role = Role.new(:descricao => 'administrador')
role.save
user = User.new(:email => 'admin@admin.com.br', 
	:password => 'admin123', 
	:password_confirmation => 'admin123', 
	:role_id => role.id)
user.save

