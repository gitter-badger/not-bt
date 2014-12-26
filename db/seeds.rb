# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [
  'Damaged Sign',
  'City Trash Receptacle',
  'Graffiti',
  "Litter on Sidewalk/Gutter",
  'Pothole',
  'Sidewalk Patch',
  'Streetlight',
  'Snow/Ice Control',
  'Unshoveled Sidewalk',
  'Other'
]

categories.each do |category|
  Category.create(name: category)
end
