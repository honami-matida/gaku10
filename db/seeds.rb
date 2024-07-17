# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: '123@456', password: '123456')

a = Customer.find_or_create_by!(email: "aaa@aaa") do |customer|
  customer.name = "a"
  customer.password = "aaaaaa"

end

b = Customer.find_or_create_by!(email: "bbb@bbb") do |customer|
  customer.name = "b"
  customer.password = "bbbbbb"

end

c = Customer.find_or_create_by!(email: "ccc@ccc") do |customer|
  customer.name = "c"
  customer.password = "cccccc"

end