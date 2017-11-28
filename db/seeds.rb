# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs
random = Random.new
User.create!(
	name:  "Admin",
	email: "admin@gmail.com",
	password:              "admin1",
	password_confirmation: "admin1",
	avatar: "nam.jpg",
	admin: true)
puts "Create Account admin"

User.create!(
	name:  "グイン　ヴァン　ナム",
	email: "nam@gmail.com",
	password:             	"123456",
	password_confirmation: "123456",
	avatar: "nam.jpg",
	admin: false)
puts "Create Account:Nam Password:123456"

100.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@gmail.org"
	password = "123456"
	gender = random.rand(0..1)
	User.create!(
		name: name,
		email: email,
		password: password,
		gender: gender,
		admin: false,
		password_confirmation: password,
		avatar: "/customer/ava-default-male.jpg",
		intro: "This is user example-#{n+1}")
end

puts "Create 100 USER"

User.all.each do |user|
	5.times do |t|
		Relationship.create!(
			followed_id: user.id,
			follower_id: random.rand(2..102))
	end
end
puts "Create Relationship for User"

Localtion.create!(name:  "vietnam");
Localtion.create!(name:  "japan");
Localtion.create!(name:  "english");
puts "Create Localtion"


50.times do |x|
	name = Faker::Name.name
	avatar = "/singer/album ("+random.rand(100..298).to_s+").jpg"
	Author.create!(
		name: name,
		avatar: avatar)
end
puts "Created 50 Author"

50.times do |x|
	name = Faker::Name.name
	localtion_id = random.rand(1..3)
	avatar = "/singer/album ("+random.rand(100..298).to_s+").jpg"

	Singer.create!(
		name: name,
		avatar: avatar,
		localtion_id: localtion_id)
end
puts "Created 50 Singer"

15.times do |x|
	category = Faker::Book.genre
	slug = category.parameterize
	Category.create!(
		name: category,
		slug: slug	)
end
puts "Created 15 Category"

50.times do |al|
	title = Faker::Book.title
	desc = "This is description for #{title}."
	singer_id = random.rand(1..50)
	category_id = random.rand(1..15)
	localtion_id = random.rand(1..3)
	if(localtion_id == 1)
		cover =  "/album2/album ("+random.rand(1..337).to_s+").jpg"
	end
	if(localtion_id == 2)
			cover =  "/image_uc_uk/us-uc ("+random.rand(1..190).to_s+").jpg"
	end
	if(localtion_id == 3)
		cover =  "/image_japan/japan ("+random.rand(1..135).to_s+").jpg"
	end
	Album.create!(
		title: title,
		description: desc,
		singer_id: singer_id,
		category_id: category_id,
		sum_rate: 0,
		photo: cover,
		rate_avg: 0)
end
puts "Created 50 albums"

100.times do |n|
	title = Faker::Book.title
	desc = "This is description for #{title}."
	author_id = random.rand(1..50)
	album_id = random.rand(1..55)
	localtion_id = random.rand(1..3)
	slug = title.parameterize
	if(localtion_id == 1)
		cover =  "/album2/album ("+random.rand(1..337).to_s+").jpg"
	end
	if(localtion_id == 2)
			cover =  "/image_uc_uk/us-uc ("+random.rand(1..190).to_s+").jpg"
	end
	if(localtion_id == 3)
		cover =  "/image_japan/japan ("+random.rand(1..135).to_s+").jpg"
	end
	Song.create!(
		title: title,
		description: desc,
		author_id: author_id,
		sum_rate: 0,
		rate_avg: 0,
		slug: slug,
		localtion_id: localtion_id,
		cover: cover,
		album_id: album_id)
end
puts "Created 100 Songs"

Song.all.each do |s|
	5.times do |x|
		title = Faker::Book.title
		content = Faker::HarryPotter.quote + Faker::HarryPotter.quote
		user_id = random.rand(1..50)
		rate_rv = random.rand(0..5)
		Review.create!( title: title,
			content: content,
			user_id: user_id,
			song_id: s.id,
			rate_score: rate_rv

			)
		s.update_attributes( :rate_avg => ((s.sum_rate*s.rate_avg + rate_rv)/(s.sum_rate + 1)), :sum_rate => (s.sum_rate + 1))
	end
end
puts "Create 5 Review for each Songs"

Song.all.each do |s|
	2.times do |x|
		category_id = random.rand(1..10)
		RelSongCategory.create!(
			song_id: s.id,
			category_id: category_id
			)
	end
end
puts "Create Song for category"

Song.all.each do |s|
	id = random.rand(1..30)
	SongSinger.create!( singer_id: id,
		song_id: s.id
		)
end
puts "Created Song for Singer"

Album.all.each do |s|
	auto = random.rand(1..10)
	auto.times do |x|
		content = Faker::HarryPotter.quote
		user_id = random.rand(1..50)
		AlbumComment.create!(
			content: content,
			user_id: user_id,
			album_id: s.id,
			)
	end
end
puts "Create Comment for each Album"

Album.all.each do |s|
	count = random.rand(1..10)
	count.times do |like|
		user_id = random.rand(1..50)
		AlbumLike.create!(
			user_id: user_id,
			album_id: s.id,
			)
	end
end
puts "Create Like for each Album"
