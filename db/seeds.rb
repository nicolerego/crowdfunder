100.times do 
	Project.create! (
		name: Faker::Comapny.name,
		description: Faker::Lorem.paragraph(2),
		start_date: rand(10).days.from_now.to_date, 
		end_date: rand(10).days.from_now.to_date, 
		funding_goal: rand(100000)
	)
end 

