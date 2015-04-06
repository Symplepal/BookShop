# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Users seed

User.destroy_all

admin = User.create!(email: 'admin@example.com',
                     name: 'Admin',
                     password: '12345678',
                     password_confirmation: '12345678'
                      )

admin.add_role :admin

customer = User.create!(email: 'customer@example.com',
                     name: 'Customer',
                     password: '12345678',
                     password_confirmation: '12345678'
)
customer.purchases << Purchase.new(state: 'open')
customer.save!
customer.add_role :customer

#Publisher seed

Publisher.destroy_all

publishers = Publisher.create!([{name: 'Amazon'}])

#Author seed

Author.destroy_all

authors = Author.create!([{name: 'George R.R. Martin'}, {name: 'H.P. Lovecraft'}, {name: 'Arthur Conan Doyle'}, {name: 'Jamie Oliver'},
                          {name: 'J.K. Rowling'},])

#Genres seed

Genre.destroy_all

genres = Genre.create!([{name: 'Fantasy'},
                        {name: 'Mystery'},
                        {name: 'Sci-fi'},
                        {name: 'Horror'},
                        {name: 'Business'},
                        {name: 'Classics'},
                        {name: 'Manga'},
                        {name: 'Poetry'},
                        {name: 'Cookbooks'},
                        {name: 'Romance'},
                        {name: 'Thriller'},
                        {name: 'History'},
                        {name: 'Fiction'},
                        {name: 'Crime'},
                        {name: 'Children\'s'},
                        {name: 'Comics'},
                        {name: 'Novels'}])

#Stores seed

Store.destroy_all
BookStore.destroy_all

stores = Store.create!([{name: 'Szegedi Könyvesbolt', address: '6734 Szeged, Pál utca 4.'},
                        {name: 'Pesti Könyvesbolt', address: '1334 Budapest, Szent István tér 3.'},])

#Books seed

Book.destroy_all

books = Book.create!([{title: 'A Dance with Dragons',
                       author: Author.find_by(name: 'George R.R. Martin'),
                       publisher: Publisher.find_by(name: 'Amazon'),
                       price: 4990,
                       published_date: Date.new(2011,01,01),
                       page_count: 1125,
                       genres: Genre.where(name: ['Fantasy', 'Fiction']),
                       description: 'In the aftermath of a colossal battle, the future of the Seven Kingdoms hangs in the balance — beset by newly emerging threats from every direction. In the east, Daenerys Targaryen, the last scion of House Targaryen, rules with her three dragons as queen of a city built on dust and death.
                        But Daenerys has thousands of enemies, and many have set out to find her. As they gather, one young man embarks upon his own quest for the queen,
                        with an entirely different goal in mind.'},
                      {title: 'The Call of Cthulhu',
                       author: Author.find_by(name: 'H.P. Lovecraft'),
                       publisher: Publisher.find_by(name: 'Amazon'),
                       price: 2990,
                       published_date: Date.new(1926),
                       page_count: 43,
                       genres: Genre.where(name: ['Fantasy', 'Horror', 'Classics', 'Novels']),
                       description: 'One of the feature stories of the Cthulhu Mythos, H.P. Lovecraft’s “The Call of Cthulhu” is a harrowing tale
                         of the weakness of the human mind when confronted by powers and intelligences from beyond our world.'},
                      {title: 'The Complete Sherlock Holmes',
                       author: Author.find_by(name: 'Arthur Conan Doyle'),
                       publisher: Publisher.find_by(name: 'Amazon'),
                       price: 6990,
                       published_date: Date.new(1986,10,01),
                       page_count: 1796,
                       genres: Genre.where(name: ['Mystery', 'Crime', 'Classics']),
                       description: 'London Edwardian private detective Sherlock Holmes. Four novels, 5 books of 56 short stories.
                        1 A Study in Scarlet
                        2 The Sign of the Four
                        3 The Hound of the Baskervilles
                        4 The Valley of Fear

                        1 The Adventures of Sherlock Holmes
                        2 The Memoirs of Sherlock Holmes
                        3 The Return of Sherlock Holmes
                        4 His Last Bow
                        5 The Case-Book of Sherlock Holmes'},
                      {title: 'Cook with Jamie',
                       author: Author.find_by(name: 'Jamie Oliver'),
                       publisher: Publisher.find_by(name: 'Amazon'),
                       price: 5990,
                       published_date: Date.new(2007,06,01),
                       page_count: 437,
                       genres: Genre.where(name: ['Cookbooks']),
                       description: 'This is my guide to making you a better cook and it\'s the biggest book I\'ve ever done!
                       I think it looks beautiful and is full of simple and accessible recipes (160 of them!)
                       that will blow the socks off your family and any guests you might have round for dinner.
                       And that\'s not all ... there\’s information on the equipment that I think you should have in your kitchen,
                       advice on how to recognize and cook loads of different cuts of meat, as well as on how to get the best value
                       and quality when you\’re out shopping.
                       With Britain consuming more processed food than the rest of Europe put together, it\’s a sad fact that most people just aren\’t
                       confident enough to cook any more. I\'m hoping that with this new book, everyone will get stuck in and reclaim our fantastic cooking heritage!'},
                      {title: 'Harry Potter Boxset',
                       author: Author.find_by(name: 'J.K. Rowling'),
                       publisher: Publisher.find_by(name: 'Amazon'),
                       price: 16990,
                       published_date: Date.new(2007,10,16),
                       page_count: 4100,
                       genres: Genre.where(name: ['Children\'s', 'Fantasy', 'Fiction', 'Novels']),
                       description: 'The exciting tales of Harry Potter, the young wizard-in-training, have taken the world by storm,
                       and fans just can\'t get enough of the magical world of Hogwarts and beyond. If you buy one of the Harry Potter books,
                       we guarantee you\'ll want the next...and the next...and the next -- so why not have them all, right at your fingertips? With the Harry Potter Boxed Set (Years 1-7),
                       Barnes & Noble.com offers simple one-stop shopping for your Harry Potter library! As easy as the wave of a magic wand, you can get all seven Harry Potter books delivered to your doorstep at once.
                       The Harry Potter Boxed Set includes hardcover editions of Harry Potter and the Sorcerer\'s Stone, Harry Potter and the Chamber of Secrets, Harry Potter and the Prisoner of Azkaban,
                       Harry Potter and the Goblet of Fire, Harry Potter and the Order of the Phoenix, Harry Potter and the Half-Blood Prince, and Harry Potter and the Deathly Hallows. The books come snugly packed in a decorative,
                       trunk-like box with sturdy handles and a privacy lock -- and includes decorative stickers!'},])

BookStore.create!([{book: Book.find_by(title: 'A Dance with Dragons'), store: Store.find_by(name: 'Szegedi Könyvesbolt'), quantity: 30},
                   {book: Book.find_by(title: 'The Call of Cthulhu'), store: Store.find_by(name: 'Szegedi Könyvesbolt'), quantity: 15},
                   {book: Book.find_by(title: 'The Complete Sherlock Holmes'), store: Store.find_by(name: 'Szegedi Könyvesbolt'), quantity: 42},
                   {book: Book.find_by(title: 'Cook with Jamie'), store: Store.find_by(name: 'Szegedi Könyvesbolt'), quantity: 10},
                   {book: Book.find_by(title: 'Harry Potter Boxset'), store: Store.find_by(name: 'Szegedi Könyvesbolt'), quantity: 13},
                   {book: Book.find_by(title: 'A Dance with Dragons'), store: Store.find_by(name: 'Pesti Könyvesbolt'), quantity: 23},
                   {book: Book.find_by(title: 'The Call of Cthulhu'), store: Store.find_by(name: 'Pesti Könyvesbolt'), quantity: 34},
                   {book: Book.find_by(title: 'The Complete Sherlock Holmes'), store: Store.find_by(name: 'Pesti Könyvesbolt'), quantity: 8},
                   {book: Book.find_by(title: 'Cook with Jamie'), store: Store.find_by(name: 'Pesti Könyvesbolt'), quantity: 2},
                   {book: Book.find_by(title: 'Harry Potter Boxset'), store: Store.find_by(name: 'Pesti Könyvesbolt'), quantity: 5},
                   ])
