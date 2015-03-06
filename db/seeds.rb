puts "\n Making Users"
100.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name:  Faker::Name.last_name,
        email:      Faker::Internet.email,
        password:   "12345678",
        password_confirmation:   "12345678"

    )
  print "|"
end


puts "\n Making Projects"
200.times do
    project = Project.create!(
        name:           Faker::Commerce.product_name,
        description:    Faker::Hacker.say_something_smart,
        funding_goal:   Faker::Number.number(6),
        start_date:     Date.today,
        end_date:       Date.today + rand(30).days,
        owner_id:       User.all.sample.id
    )
    print "|" 

    rand(6).times do
        Reward.create!( 
            title:          Faker::Company.catch_phrase,
            description:    Faker::Lorem.sentence,
            backer_limit:   rand(100),
            amount:         rand(1000),
            project_id:     project.id
        )
        print "|" 
    end
end

puts "\n Making Pledges"
200.times do
    project = Project.all.sample
    if project.rewards.count < 0
        Pledge.create!(
            amount:      rand(1000), 
            backer_id:   User.all.sample.id, 
            project_id:  project.id,
            reward_id:   project.rewards.first.id
        )
        print "|"
    end
end