# Clean the database
puts 'Deleting users, userdocs, docs, versions & commments ...'
Comment.destroy_all
Version.destroy_all
Doc.destroy_all
User.destroy_all
Userdoc.destroy_all

# Users, Docs & Userdocs
puts 'Creating users, docs & userdocs ...'

4.times do
  user = User.create(first_name: 'Tiago',last_name: 'Oliveirinha', address: 'Arroios', phone_number: '911231212', company: 'Covillage', email: 'tiago@me.pt', password: '123456')
  doc = Doc.create(title: Faker::Lorem.sentence, text: Faker::Lorem.paragraphs(number: 20))
  Userdoc.create(owner: true, user, doc)
end
4.times do
  user = User.create(first_name: 'Diogo',last_name: 'Brôco', address: 'Intendente', phone_number: '934567890', company: 'Pipedrive', email: 'diogo@me.pt', password: '123456')
  doc = Doc.create(title: Faker::Lorem.sentence, text: Faker::Lorem.paragraphs(number: 20))
  Userdoc.create(owner: true, user, doc)
end
4.times do
  user = User.create(first_name: 'Felipe',last_name: 'Santos', address: 'Alvalade', phone_number: '969876543', company: 'The Best', email: 'felipe@me.pt', password: '123456')
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
