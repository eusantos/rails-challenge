# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cust1 = Customer.create({first_name: "Johny", last_name: "Flow"})
cust2 = Customer.create({first_name: "Raj", last_name: "Jamnis"})
cust3 = Customer.create({first_name: "Andrew", last_name: "Chung"})
cust4 = Customer.create({first_name: "Mike", last_name: "Smith"})

#10 Should be successful transactions
5.times.map{Charge.create({customer:cust1, amount: Random.rand(10000), paid: true})}
3.times.map{Charge.create({customer:cust2, amount: Random.rand(10000), paid: true})}
1.times.map{Charge.create({customer:cust3, amount: Random.rand(10000), paid: true})}
1.times.map{Charge.create({customer:cust4, amount: Random.rand(10000), paid: true})}

#5 Should be transactions that failed
3.times.map{Charge.create({customer:cust3, amount: Random.rand(10000), refunded: true})}
2.times.map{Charge.create({customer:cust4, amount: Random.rand(10000), refunded: true})}

#5 Should be disputed
3.times.map{Charge.create({customer:cust1, amount: Random.rand(10000), disputed: true})}
2.times.map{Charge.create({customer:cust2, amount: Random.rand(10000), disputed: true})}