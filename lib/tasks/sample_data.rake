namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_events
    # make_relationships
    # make_shops
  end
end

def make_users
    avatar = File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/sampleProfileImages', '*')).sample)
    admin = User.create!(firstname: "admin",
                 lastname: "admin",
                 avatar: avatar,
                 email: "admin@example.com",
                 password: "foobar2013",
                 password_confirmation: "foobar2013")

    admin.toggle!(:admin)

    30.times do |n|
      first_name  = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      email = "user-#{n+1}@frock.com"
      username  = "@" + (first_name+last_name).downcase
      avatar = File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/sampleProfileImages', '*')).sample)
      User.create!(firstname: first_name,
                   lastname: last_name,
                   avatar: avatar,
                   email: email,
                   password: "foobar2013",
                   password_confirmation: "foobar2013")
    end
  end

  #  def make_shops
  #   users = User.all(limit: 6)
  #    3.times do |n|
  #     name  = Faker::Name.name
  #     email = "shop-#{n+1}@frockshop.com"
  #     photo = File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/sampleShopImages', '*')).sample)
  #     description = ["cloths for mature ladies", "fiesty frocks", "preppy", "sporty", "nautical",
  #       "vintage", "hippie", "shlumpadinka"].sample
  #     users.each { |user| user.shops.create!(name: name,
  #                  photo: photo,
  #                  description: description,
  #                  email: email) }
  #   end
  #  end

   def make_events
    60.times do
      photo = File.open(Dir.glob(File.join(Rails.root, 'app/assets/images/sampleImages', '*')).sample)
      description = "Lorem ipsum In minim consequat minim ut dolore dolor Duis consectetur sed sunt. Lorem ipsum In dolor ut adipisicing culpa in cupidatat sunt amet ad."
      category = %w( sport comedy theatre music art ).sample
      User.first(:offset => rand(User.count)).events.create!(photo: photo, description: description, category: category)
    end
   end

  # def make_relationships
  #   users = User.all
  #   user  = users.first
  #   followed_users = users[2..30]
  #   followers      = users[3..20]
  #   followed_users.each { |followed| user.follow!(followed) }
  #   followers.each      { |follower| follower.follow!(user) }
  # end
