require "open-uri"

# Clean the database
puts 'Deleting users, userdocs, docs, versions & commments ...'
Comment.destroy_all
Version.destroy_all
Userdoc.destroy_all
Doc.destroy_all
User.destroy_all

def create_doc_and_version(user)
  doc = Doc.create!(title: Faker::Lorem.sentence, rich_body: Faker::Lorem.paragraphs(number: 20), locked: false, final: false)
  Userdoc.create!(owner: true, user: user, doc: doc)
  version = Version.create!(rich_body: doc.rich_body, accepted: false, doc: doc, user: user)
  Comment.create!(text: Faker::Lorem.sentence, version: version, user: user)
end

puts 'Creating users, docs, userdocs, versions (texts identical to docs) & comments ...'

user = User.create(first_name: 'Tiago',last_name: 'Oliveirinha', address: 'Arroios', phone_number: '911231212', company: 'FootManager', email: 'tiago@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/63858592?v=4')
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.save
# 4.times { create_doc_and_version(user) }

user = User.create(first_name: 'Diogo',last_name: 'Brôco', address: 'Intendente', phone_number: '934567890', company: 'FootManager', email: 'diogo@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/76879710?v=4')
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.save
# 4.times { create_doc_and_version(user) }

user = User.create(first_name: 'Felipe',last_name: 'Santos', address: 'Alvalade', phone_number: '969876543', company: 'FootManager', email: 'felipe@me.pt', password: '123456')
file = URI.open('https://avatars.githubusercontent.com/u/75455106?v=4')
user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
user.save
# 4.times { create_doc_and_version(user) }

puts "Created #{User.count} users"
# puts "Created #{Doc.count} docs"
# puts "Created #{Userdoc.count} userdocs"
# puts "Created #{Version.count} versions"
# puts "Created #{Comment.count} comments"
