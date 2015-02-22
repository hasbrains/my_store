namespace :db do
  namespace :populate do

    if Kernel.const_defined?("Faker")

      desc "removes all existing records"
      task clear: [:environment] do
        User.delete_all
        Item.delete_all
      end

      desc "creates users"
      task users: [:environment] do
        print "Creating users"
        10.times do
          print "."
          User.create!(
            email: Faker::Internet.email,
            login: Faker::Internet.user_name,
            password: 'password'
          )
        end
        print "done!\n"
      end

      desc "creates store items"
      task items: [:environment] do
        print "Creating items"
        50.times do
          print "."
          Item.create!(
            price: (1..100).to_a.sample,
            name: Faker::Lorem.words(2).join(' '),
            real: [true, false].sample,
            weight: (1..10).to_a.sample,
            description: Faker::Lorem.sentence
          )
        end
        print "done!\n"
      end
    

    end

  end
end
