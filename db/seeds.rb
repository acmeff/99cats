# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat1 = Cat.create(name: 'Tim', birth_date: '2009/03/12', description: 'friendly', sex:'M', color:'Purple')
cat2 = Cat.create(name: 'Alice', birth_date: '2010/05/12', description: 'mean', sex:'F', color:'Green')
cat3 = Cat.create(name: 'Snowball', birth_date: '2008/05/12', description: 'hostile', sex:'F', color:'Tie-Dye')
