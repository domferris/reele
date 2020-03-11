require 'faker'
require 'open-uri'

puts "Destroying all users and projects..."

User.destroy_all
# Category.destroy_all

puts "All users and projects destroyed."

###############################################################################
################################# CONSTANTS ###################################
###############################################################################

rand_audio_tags = %w(music hiphop rap dj art singer musician musica artist dance rock party
like follow guitar livemusic song live concert photography newmusic producer band musicvideo bhfyp
art artist beats countrymusic dance dj funko folk goodmusic indiemusic livemusic love musician
newmusic newsong party partymusic pop pop popmusic remix sing singer bass dance deephouse dj djlife dubstep
edm edmfamily edmlife edmlifestyle edmmusic electro electrohouse electronic electronicmusic
festival goodmusic hiphop hipphopmusic house housemusic indiemusic livemusic musicaltheatre
musicclover musicfestival musicphotography musicproducer musicproduction
musicvideo newmusic nightlife party partymusic plur popmusic producer
progressivehouse rave rockmusic summer techhouse techno tomorrowland)

rand_video_tags = %w(musicvideos viral guitar pop musiclife livemusic songwriter explorepage
film beats dj singersongwriter likeforlikes spotify repost soundcloud rock musiclover rapmusic
hiphopmusic director goodmusic coversong videography songs singing studio musicvideo music hiphop
musician video rap newmusic love musically singer artist song youtube musica musicproducer like
rapper musicians musicislife art follow producer cover tiktok photography dance bhfyp progressivehouse
rave rockmusic summer techhouse techno tomorrowland goodmusic indiemusic livemusic love
musician newmusic newsong party partymusic pop pop popmusic)

rand_category = ["Music",
                "Songwriting",
                "Session Musician",
                "Mixing",
                "Mastering",
                "Audio Engineer",
                "Producer",
                "Sound Design",
                "Composition",
                "Voice-Over",
                "ADR Recording",
                "Music Editor",
                "Foley Walker",
                "Podcast",
                "Music Supervision"]
rand_project_photo = ["https://f4.bcbits.com/img/0018872164_0",
                      "https://f4.bcbits.com/img/a0232075976_16.jpg",
                      "https://f4.bcbits.com/img/0018864042_0",
                      "https://f4.bcbits.com/img/a1791626482_16.jpg",
                      "https://f4.bcbits.com/img/a0092738776_2.jpg",
                      "https://f4.bcbits.com/img/a3636119674_2.jpg",
                      "https://www.grammy.com/sites/com/files/styles/news_detail_header/public/behindtherecord_siteimage-01_smaller.png?itok=fuLl37U9",
                      "https://www.frameweb.com/media/files/284383",
                      "https://9to5mac.com/wp-content/uploads/sites/6/2017/10/horan.jpg?quality=82&strip=all",
                      "https://f4.bcbits.com/img/a1058259200_2.jpg",
                      "https://f4.bcbits.com/img/a1566687136_2.jpg",
                      "https://pbs.twimg.com/media/D0Mt_84WoAAYobl.jpg",
                      "https://cloud.netlifyusercontent.com/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/99bd31fd-b68e-4fa6-b351-62173827ac21/67.jpg",
                      "https://cloud.netlifyusercontent.com/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/aecf4604-1d3b-417f-97c6-d5be80f51eb9/3.jpg",
                      "https://cloud.netlifyusercontent.com/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/68c5957a-9e3f-458d-ac48-4fa40c2b7394/27.jpg",
                      "https://cloud.netlifyusercontent.com/assets/344dbf88-fdf9-42bb-adb4-46f01eedd629/6b9372ef-267d-49e4-a04c-e4264d8f337a/15.jpg",
                      "https://res.cloudinary.com/www-virgin-com/virgin-com-prod/sites/virgin.com/files/Articles/Music/mixing_desk_1.jpg",
                      "https://pbs.twimg.com/media/D7VtgYoWwAErwGL.jpg",
                      "https://i.pinimg.com/originals/ee/32/23/ee3223fed80269df20dc2f187febbbdf.jpg",
                      "https://us-758c.kxcdn.com/wp-content/uploads/2019/01/how-to-make-money-as-a-music-producer.jpg",
                      "https://pbs.twimg.com/media/EO0H_OCWoAQUyj0.jpg",
                      "https://www.cbc.ca/thislife/content/images/episodes/1280_this_life_music.jpg",
                      "https://wyntonmarsalis.org/images/made/images/gallery/2017/december/spotifystudios/_resized/259_JALC5198_lawrence-sumulong_1200_799_90auto.jpg",
                      "https://i.ytimg.com/vi/sazcPopqBJE/maxresdefault.jpg",
                      "https://i.ytimg.com/vi/Olulby2OsRI/maxresdefault.jpg",
                      "https://steemitimages.com/DQmQGTPJZiotXR8sq1oSEsafwANBrAv5rHiBwPxKB2atoQm/IMG_2045.JPG",
                      "https://i.ytimg.com/vi/pXix_93LCgE/maxresdefault.jpg",
                      "https://pro2-bar-s3-cdn-cf.myportfolio.com/49399bd15730bbe1f1d660a24af9d849/8b56c1cce85991fd7e094399_rw_1200.jpg?h=60af6ce26d0402520459ae766f2cc0f0",
                      "https://i.pinimg.com/originals/12/2c/ac/122cacd1e54ddb6350feeccf52fc365e.jpg",
                      "https://www.syfy.com/sites/syfy/files/styles/1200x680/public/2017/12/screen_shot_2017-12-15_at_12.31.09_pm.png",
                      "https://cdn.vanderbilt.edu/vu-my/wp-content/uploads/sites/2352/2017/04/14141347/Sweatt-Cover-Art-1.jpg",
                      "https://i.ytimg.com/vi/p15GKaYgIys/maxresdefault.jpg",
                      "https://soundrop.com/wp-content/uploads/2019/07/sd_hero-image_toni-leys_2000x1456px.jpg",
                      "https://www.geeky-gadgets.com/wp-content/uploads/2019/12/Resident-Evil-3-remake.jpg",
                      "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/924faf52097223.590463d34792e.jpg",
                      "https://iconcollective.edu/wp-content/uploads/Album-Cover-Art.jpg",
                      "https://www.artwort.com/wp-content/uploads/2018/03/copertina.jpg"]
rand_media_type = ["audio", "video"]
dummy_avatar = ['112155602-98394085-28e5-49d3-9dbf-5f3309eafd6c.jpg',
                '200011.jpg',
                '255ab4200a3f46b5f7427070073825f8.jpg',
                '47c59518a653055eb8fffb72def387d4.jpg',
                '7837ab3a78aa548623b030e180f613bb2420ad7fr1-720-712v2_uhq.jpg',
                '7tg8hq.snsg8c.im.lg.jpg',
                '8801200_orig.jpg',
                'aNWjR7MB_400x400.jpg',
                'cfa1f991b1407f9e310dd7798693abb8.jpg',
                'D7XC43HXoAAGfA1.jpg',
                'f284f8a54a18b10502e35510925746e0.jpg',
                'f355f9b727091ba07fa434d775a5d34c.jpg',
                'image-asset.jpeg',
                'marielu-a4ebf30c9cd9360c44fc78e3f721109627dbd925.jpg',
                'pexels-photo-1681010.jpeg',
                'pexels-photo-774909.jpeg',
                'photo-1506794778202-cad84cf45f1d.jpeg',
                'portrait-photography-use-a-prop-1.jpg',
                'recent-portraits-random-people-in-random-places_10.jpg',
                'USZWGM4N_400x400.jpg']

###############################################################################
############################### TYLER CREATION ################################
###############################################################################

puts "Creating Tyler Dobson..."

User.create!(
  first_name: "Tyler",
  last_name: "Dobson",
  username: "tyler_dobson",
  bio: "Musician from Los Angeles. New album in the works! I've been working in the industry for the last 4 years as a freelance session musician and sound engineer. If you like what you see, reach out!",
  specialty: "Music, Sound Engineering",
  email: "tyler.dobson@gmail.com",
  password: '123456'
  )

puts "Tyler Dobson AKA tylerkitty created."

###############################################################################
###################### TYLER'S EXISTING RANDOM PROJECTS #######################
###############################################################################

puts "Creating Tyler's random exising projects..."

6.times do
  rand_views = rand(100..2500)
  Project.create!(
    title: Faker::Music.album,
    description: Faker::Movies::PrincessBride.quote,
    media_type: rand_media_type.sample,
    category: ["Music", "Composition", "Audio Engineer"].sample,
    published: true,
    user_id: User.first.id,
    photo: rand_project_photo.sample,
    view_count: rand_views,
    likes: (rand_views*rand(0.1..0.2)).floor,
    tag_list: rand_audio_tags.sample(rand(5..10))
  )
end

2.times do
  Project.create!(
    title: Faker::Music.album + "_v" + rand(3..8).to_s,
    description: Faker::Movies::PrincessBride.quote,
    media_type: "audio",
    category: ["Music", "Composition", "Audio Engineer"].sample,
    published: false,
    user_id: User.first.id,
    photo: rand_project_photo.sample,
    tag_list: rand_audio_tags.sample(rand(5..10))
  )
end

puts "Tyler's random exising projects created."

###############################################################################
###################### TYLER'S "REAL"/CLICKABLE PROJECTS ######################
###############################################################################

puts "Creating Tyler's realistic, interactable private project..."

t1 = Project.create!(
  title: "corduroy_velvet_final_v8",
  description: "A short film for musician Emmitt James. I produced all of the music that soundtracks this film. Emmitt and I worked closely for seven months throughout his album creation process.",
  media_type: "video",
  published: false,
  user_id: User.first.id,
  category: "Composition",
  video_url: "https://player.vimeo.com/video/304107088?color=ffffff&title=0&byline=0&portrait=0",
)
  file = URI.open(Rails.root.join('app','assets','images','tyler-project-thumbnail.png'))
  t1.photo = file

puts "Tyler's realistic, interactable private project created."

###############################################################################
############################# DUMMY USER CREATION #############################
###############################################################################

puts "Creating 20 fake users..."

20.times do
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.unique.username(specifier: nil, separators: ['_']),
    password: '******',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraph(sentence_count: 5),
    specialty: rand_category.sample
    )
  file = URI.open(Rails.root.join('app','assets','images', 'dummy_avatars', dummy_avatar.sample))
  user.photo.attach(io: file, filename: "#{user.username}.jpeg", content_type: 'image/jpeg')
  puts "created #{user.username}"
end

puts "20 fake users created."

###############################################################################
######################### DUMMY USER PROJECT CREATION #########################
###############################################################################

puts "Creating fake video projects..."

80.times do
  rand_views = rand(500..200000)
  Project.create!(
    title: Faker::Music.album,
    description: Faker::Movies::PrincessBride.quote,
    media_type: "video",
    category: rand_category.sample,
    published: true,
    user_id: rand(2..21),
    photo: rand_project_photo.sample,
    video_url: "https://player.vimeo.com/video/304107088?color=ffffff&title=0&byline=0&portrait=0",
    view_count: rand_views,
    likes: (rand_views*rand(0.1..0.2)).floor,
    tag_list: rand_video_tags.sample(rand(5..10))
  )
end

puts "Fake video projects created."

puts "Creating fake audio projects..."

80.times do
  rand_views = rand(500..200000)
  Project.create!(
    title: Faker::Music.album,
    description: Faker::Movies::PrincessBride.quote,
    media_type: "audio",
    category: rand_category.sample,
    published: true,
    user_id: rand(2..21),
    photo: rand_project_photo.sample,
    video_url: "https://player.vimeo.com/video/304107088?color=ffffff&title=0&byline=0&portrait=0",
    view_count: rand_views,
    likes: (rand_views*rand(0.1..0.2)).floor,
    tag_list: rand_audio_tags.sample(rand(5..10))
  )
end

puts "Fake audio projects created."

puts "All fake projects created."

puts "Seeded successfully!"

###############################################################################
############################### SAVED FOR LATER ###############################
###############################################################################

# file = URI.open(Rails.root.join('app','assets','images','iu-3.jpeg'))
# user.photos.attach(io: file, filename: "#{user.name}.jpeg", content_type: 'image/jpeg')

######### Category creation ###########
# puts "Generating categories..."

#   cats.each do |category|
#     Category.create!(
#       name: category
#       )
#   end
