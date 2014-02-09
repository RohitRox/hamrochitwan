# require 'ffaker'

# user = User.last || User.create({email: "user@hamrochitwan.com", password: "11111111", password_confirmation: "11111111"})

# 10.times do |i|

# 	user.posts.create!({
# 		title: Faker::Company.name,
# 		description: Faker::Lorem.paragraph,
# 		price: rand(0..50000).to_f,
# 		status: 0,
# 		home_delivery: false,
# 		used_for: "#{rand(2..10)} months",
# 		condition: "Good",
# 		expiry_date: Time.now + 30.days
# 		})
	
# end

businesses_dump = 
[
	"Agriculture",
	"Auto And Parts",
	{"Banks And Finance" => 
		["Banks","Insurance"]},
	{"Business And Professionals" => 
		["Construction","Law Firm","Real Estate"]},
	{"Communication, Media And Publishing" => 
		["Courier Services","Newspapers","Photography","Printing And Publishing","Radio And F.M.","Telecommunication Services","CableNet", "CyberCafe"]},
	{"Computers, Electronics And Electricals" => 
		["Computers Sales And Repair","Electricals","Household Electronics","Mobile And Accessories"]},
	{"Education And Training" =>
		["Colleges","Schools","Training Institutes"]},
	"Fire Brigades",
	"Government Offices",
	{"Health And Medicine" =>
		["Dental","Hospitals","Pharmaceuticals","Veterinary"]},
	{"Hotels And Fooding" =>
		["Bars","Cafe","Guest Houses","Hotels","Party Palaces","Restaurants"]},
	"IT Solutions And Services",
	{"Libraries And Communities" =>
		["Churches","Libraries", "Social Clubs"]},
	"Police",
	{"Recreation And Sports" =>
		["Arts And Galleries","Cinema","Gym And Fitness","Swimming Pools"]},
	{"Services And Others" =>
		["Beauty Parlour","Petrol Pumps","Plumbing","Salons"]},
	{"Stores And Shops" =>
		["Dealers","Departmental Stores","Grocery","Retailers","Winery","Fancy Stores"]},
	{"Travels And Tourisms" =>
		["Buses And Flights","Travel Agencies"]},
	"Temples"
]

businesses_dump.each do |dump|
	if dump.is_a?(Hash)
		b = Business.create(title: dump.keys.first)
		dump.values.first.each do |sub_dump|
			Business.create(title: sub_dump, parent_id: b.id)
		end
	else
		Business.create(title: dump)
	end
end