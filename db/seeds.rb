require 'faker'

puts "Destroying all users and projects"
User.destroy_all
Category.destroy_all


######### Category creation ###########
puts "Generating categories..."

  cats = ["Mixing","Mastering","Audio Engineer", "Producer", "Sound Design", "Composition"]
  cats.each do |category|
    Category.create!(
      name: category
      )
  end

######### Tyler creation ###########

puts "Creating Tyler Kitty "

  User.create!(
    first_name: "Tyler",
    last_name: "Kitty",
    username: "tylerkitty",
    bio: "Sound engineer from LA. Love audio and video, and music of all genres.",
    specialty: "sound engineer",
    email: "tyler@kitty.com",
    password: '******'
    )


tyler_project_mixtape = Project.create!(
    title: "Mixtape",
    description: "A great mixtape where I play with some base tracks and some groovy melodies",
    media_type: "video",
    published: false,
    user_id: User.first.id,
    category: "Mixing",
    video_url: "https://player.vimeo.com/video/304107088?color=ffffff&title=0&byline=0&portrait=0",
    # file = URI.open(Rails.root.join('app','assets','images','iu-3.jpeg')),
    # project.photo.attach(io: file, filename: "#{project.name}.jpeg", content_type: 'image/jpeg')
    )

# 5 * tyler projects

puts "Created User and Projects for Tyler Kitty"



######### User creation ###########

# 10 * user

puts "Creating 10 fake users..."

10.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.unique.username,
    password: '******',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    specialty: 'a'
    )
end

######### Project creation ###########

puts "Creating new projects..."

# 30 * projects

20.times do
  Project.create!(
    title: Faker::Music.album,
    description: Faker::Movies::PrincessBride.quote,
    media_type: ["audio","video"].sample,
    category: cats.sample,
    published: true,
    user_id: rand(2..11),
    video_url: "https://player.vimeo.com/video/304107088?color=ffffff&title=0&byline=0&portrait=0",
    # file = URI.open(Rails.root.join('app','assets','images','iu-3.jpeg'))
    # project.photo.attach(io: file, filename: "#{project.name}.jpeg", content_type: 'image/jpeg')
  )
end


puts "All seeds for projects have been created successfully!"


# file = URI.open(Rails.root.join('app','assets','images','iu-3.jpeg'))
# user.photos.attach(io: file, filename: "#{user.name}.jpeg", content_type: 'image/jpeg')



# create_table "users", force: :cascade do |t|
#   t.string "email", default: "", null: false
#   t.string "encrypted_password", default: "", null: false
#   t.string "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.string "first_name"
#   t.string "last_name"
#   t.text "bio"
#   t.string "specialty"
#   t.string "username"
#   t.index ["email"], name: "index_users_on_email", unique: true
#   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
# end

# create_table "projects", force: :cascade do |t|
#   t.string "title"
#   t.text "description"
#   t.string "media_type"
#   t.boolean "published", default: false
#   t.bigint "user_id", null: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.string "video_url"
#   t.index ["user_id"], name: "index_projects_on_user_id"
# end


