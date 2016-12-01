Traveller.destroy_all #to avoid duplication
#Create travellers
t1 = Traveller.create :email => "jack@gmail.com", :first_name => "Jack", :last_name => "Daniels", :password => "winery", :password_confirmation => "winery"
t2 = Traveller.create :email => "luis@gmail.com", :first_name => "Luis", :last_name => "Chivas", :password => "winery", :password_confirmation => "winery"
t3 = Traveller.create :email => "maria@gmail.com", :first_name => "Maria", :last_name => "Tequila", :password => "winery", :password_confirmation => "winery", :admin => true
t4 = Traveller.create :email => "lucy@gmail.com", :first_name => "Lucy", :last_name => "Lu",:password => "winery", :password_confirmation => "winery"

puts "Traveller count: #{ Traveller.all.count }"

Winery.destroy_all

w1 = Winery.create :name => 'Bay of Fires Winery'
w2 = Winery.create :name => 'Delamere Vineyard'
w3 = Winery.create :name => 'Holm Oak Vineyards'
w4 = Winery.create :name => 'Moores Hill'
w5 = Winery.create :name => 'Domaine Simha'
w6 = Winery.create :name => 'Domaine A/Stoney Vineyard'
w7 = Winery.create :name => 'Pooley Wines'
w8 = Winery.create :name => 'Freycinet Vineyard'
w9 = Winery.create :name => 'Devils Corner'


puts "Winery count: #{ Winery.all.count }"

puts "\n WINERY has_and_belongs_to_many TRAVELLERS"
puts "TRAVELLER has_and_belongs_to_many WINERIES"

w1.travellers << t1 << t2 << t4
w2.travellers << t2 << t3
w3.travellers << t4

puts "Traveller count on the first winery: #{ w1.travellers.count }"
puts "Traveller count on the second winery: #{ w2.travellers.count }"
puts "Winery count by second traveller: #{ t2.wineries.count }"

Region.destroy_all
#Create wine regions
r1 = Region.create :name => 'Tamar Valley'
r2 = Region.create :name => 'Derwent Valley'
r3 = Region.create :name => 'Coal River Valley'
r4 = Region.create :name => 'Huon Valley'
r5 = Region.create :name => 'East Coast Tasmania'
r6 = Region.create :name => 'North West Tasmania'

puts "Wine regions count: #{ Region.all.count }"


puts "\nREGION HAS_MANY WINERIES"
puts "WINERY BELONGS_TO REGION"

r1.wineries << w1 << w2 << w3 << w4
r3.wineries << w5 << w6 << w7

puts "Region one winery count: #{ r1.wineries.count } "
puts "Wineries in the third region"
r3.wineries.each do |win|
  puts "\tWinery name: #{ win.name }"
end

puts "First winery region name: #{ w1.region.name }"
puts "Second winery region anme: #{ w2.region.name }"


puts "\n TRAVELLER has_many REGIONS through WINERIES"
puts "\tRegion count for first traveller: #{ t1.regions.count }"

puts "\n REGION has_many TRAVELLERS through WINERIES"
puts "\tTraveller one for region one: #{ r1.travellers.first.first_name }"
