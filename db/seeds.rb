puts "Destroying all users and projects"
User.destroy_all

puts "Generating categories..."

  cats = ["audio", "mastering", "mixing", "mad skills", "potato"]
  cats.each do |category|
    Category.create!(
      name: category
      )
  end

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
# file = URI.open(Rails.root.join('app','assets','images','iu-3.jpeg'))
# user.photos.attach(io: file, filename: "#{user.name}.jpeg", content_type: 'image/jpeg')

puts "Created User for Tyler Kitty"

puts "Creating new projects..."

tyler_project_mixtape = Project.create!(
  title: "Mixtape",
  description: "A great mixtape where I play with some base tracks and some groovy melodies",
  media_type: "video",
  published: false,
  user_id: User.first.id,
  video_url: "https://player.vimeo.com/video/304107088?color=ffffff&title=0&byline=0&portrait=0",
  )

puts "All seeds for projects have been created successfully!"



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


