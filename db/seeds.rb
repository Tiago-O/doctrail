require "open-uri"

# Clean the database
puts 'Deleting users, userdocs, docs, versions & commments ...'
Comment.destroy_all
Version.destroy_all
Doc.destroy_all
User.destroy_all
Userdoc.destroy_all

# Users, Docs & Userdocs
puts 'Creating users, docs & userdocs ...'

user = User.create(first_name: 'Tiago',last_name: 'Oliveirinha', address: 'Arroios', phone_number: '911231212', company: 'Covillage', email: 'tiago@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/63858592?v=4')
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.save
4.times { create_doc(user) }

user = User.create(first_name: 'Diogo',last_name: 'Brôco', address: 'Intendente', phone_number: '934567890', company: 'Pipedrive', email: 'diogo@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/76879710?v=4')
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.save
4.times { create_doc(user) }

user = User.create(first_name: 'Felipe',last_name: 'Santos', address: 'Alvalade', phone_number: '969876543', company: 'The Best', email: 'felipe@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/75455106?v=4')
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.save
4.times { create_doc(user) }

def create_doc(user)
  doc = Doc.create(title: Faker::Lorem.sentence, text: Faker::Lorem.paragraphs(number: 20), locked: false, final: false)
  Userdoc.create(owner: true, user, doc)
end

puts "Created #{User.count} users"
puts "Created #{Doc.count} docs"
puts "Created #{Userdoc.count} userdocs"

# Versions
puts 'Creating versions (texts identical to docs) ...'
Doc.all.each do |doc|
  version.create(text: doc.text, accepted: false, doc: doc, user: doc.user)
end

puts "Created #{Version.count} versions"

# Comments
puts 'Creating comments ...'

Version.all.each do |version|
  Comment.create(text: Faker::Lorem.sentence, version: version, user: version.user)
end

puts "Created #{Comment.count} comments"
