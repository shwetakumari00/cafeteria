# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'admin@example.com',
	password:'password',
	password_confirmation:'password',
	admin: true
	)
Category.create!(heading: 'Pizza', body: "It's  so good,dough!",display: true)
Category.create!(heading: 'Pasta', body: "We cannoli do so much in  each video",display: true)
Category.create!(heading: 'desserts', body:"Rock rails icecream",display: true)


10.times do |i|
		pizza = Product.new(

			name: "Pizza",
		    description: "Lorem ipsum bbq chicken upstate india free range dough,",
	        price: 11.99,
	        catering: true,
			category: Category.find(1)
			 )
		pasta = Product.new(

			name: "Pasta",
		    description: "Lorem ipsum bbq chicken upstate india free range dough,",
	        price: 10.9,
	        catering: true,
			category: Category.find(2)
			 )
		dessert = Product.new(

			name: "Icecream",
		    description: "Lorem ipsum bbq chicken upstate india free range dough,",
	        price: 9.2,
	        catering: true,
			category: Category.find(3)
			 )

	pizza.image.attach(io: URI.open("https://cdn.pixabay.com/photo/2016/06/08/00/03/pizza-1442946_960_720.jpg"),filename: "#{i}_pizza_image.jpg")
	 pasta.image.attach(io: URI.open("https://media.istockphoto.com/id/857927726/photo/pasta-with-meat-tomato-sauce-and-vegetables.jpg?s=1024x1024&w=is&k=20&c=k5KvL4jlZd6Gm5ywUV1b3sH8E2oMgFKRYKTHUgp7yM4="),filename: "#{i}_pasta_image.jpg")
	 dessert.image.attach(io: URI.open("https://as1.ftcdn.net/v2/jpg/03/01/97/86/1000_F_301978652_O0aPwap1JaEVaAhj3mIlbqNnJGmRyCzC.jpg"),filename: " #{i}_dessert_image.jpg")
  
   if i == 5
  	pizza.featured = true
  	pasta.featured = true 
  	dessert.featured = true
   end 

  	pizza.save
  	pasta.save
  	dessert.save 


end


