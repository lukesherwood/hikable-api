# hike1 = Hike.create(title: 'Lake Waikaremoana',
#                     description: 'Be welcomed into the homeland of the Tūhoe people. Trace the shoreline of Lake Waikaremoana, the ‘sea of rippling waters’, through giant podocarp rainforest, remote beaches and rugged mountains with stunning views.', location: 'Lake Waikaremoana', difficulty: 'Intermediate', duration: '3-4 days', length: '46km', photo: 'https://www.doc.govt.nz/thumbs/gallery/globalassets/images/places/east-coast/lake-waikaremoana-area/lake-waikaremoana-people-1200.jpg')
# hike2 = Hike.create(title: 'Tongariro Northern Circuit',
#                     description: 'Explore the volcanic heart of Tongariro National Park, a landscape of stark glacial contrasts and alpine views. ', location: 'Tongariro National Park', difficulty: 'Intermediate', duration: '3-4 days', length: '43.1km', photo: 'https://www.doc.govt.nz/thumbs/gallery/globalassets/images/places/central-north-island/tongariro-national-park/tongariro-northern-circuit/tongariro-northern-circuit-1200.jpg')
# hike3 = Hike.create(title: 'Whanganui Journey',
#                     description: 'Explore the scenic beauty paddling up the Whanganui River, a landscape of remote hills and bush clad valleys.', location: 'Whanganui National Park', difficulty: 'Easy', duration: '3 or 5 days', length: '87km', photo: 'https://www.doc.govt.nz/thumbs/gallery/globalassets/images/places/manawatu-whanganui/bridge-to-nowhere/whanganui-journey-kayakers-1200.jpg')
# hike4 = Hike.create(title: 'Abel Tasman Coast Track',
#                     description: 'Enjoy the mild climate, golden beaches and lush coastal native bush on the Abel Tasman Coast Track.', location: 'Abel Tasman National Park', difficulty: 'Intermediate', duration: '3 - 5 days', length: '60km', photo: 'https://www.doc.govt.nz/thumbs/gallery/globalassets/images/places/nelson-tasman/abel-tasman-coastal-track/abel-tasman-day-one-1200.jpg')
# hike5 = Hike.create(title: 'Heaphy Track',
#                     description: 'Travel through expansive tussock downs, lush forests and nīkau palms to the roaring seas of the West Coast. ', location: 'Kahurangi National Park', difficulty: 'Intermediate', duration: '4-6 days', length: '78.4km', photo: 'https://www.doc.govt.nz/thumbs/gallery/globalassets/images/places/nelson-tasman/heaphy-track/heaphy-day-one-1200.jpg')
# hike6 = Hike.create(title: 'Paparoa Track and Pike29 Memorial Track',
#                     description: 'Paparoa Track crosses the Paparoa Range. It takes you through alpine tops, limestone karst landscapes and thriving rainforests, and provides breath-taking views.', location: 'Paparoa National Park', difficulty: 'Intermediate', duration: '3 days', length: '55km', photo: 'https://www.doc.govt.nz/thumbs/gallery/globalassets/images/places/west-coast/paparoa-national-park/paparoa-track/pororari-river-bridge-gallery-1200.jpg')
# hike7 = Hike.create(title: 'Routeburn Track',
#                     description: 'From November to April, weave through meadows, reflective tarns and alpine gardens, and be rewarded with spectacular vistas over vast mountain ranges and valleys. From May to October, it can be cold and wet, with ice, snow and short daylight hours - only attempt if you have alpine, navigation and river crossing skills. ', location: 'Mount Aspiring National Park ', difficulty: 'Intermediate', duration: '2-4 days', length: '33km', photo: 'https://www.doc.govt.nz/contentassets/05d800cc3c0642828c61fac93970eb0d/routeburn-winter-565.jpg')
# hike8 = Hike.create(title: 'Kepler Track',
#                     description: 'From late October to April, walk past the beech-forested shorelines of lakes Te Anau and Manapouri, to tussock-covered ridgelines with spectacular alpine vistas. From May to late October, it can be cold and wet, with ice, snow and short daylight hours - only attempt if you have alpine, navigation and river crossing skills. ', location: 'Fiordland National Park ', difficulty: 'Intermediate', duration: '3-4 days', length: '60km', photo: 'https://www.doc.govt.nz/contentassets/ca3d7d50512745c79fc1f421a0e5813c/kepler-iris-burn-565.jpg')
# hike9 = Hike.create(title: 'Milford Track',
#                     description: "From late October to April, experience 'the finest walk in the world' - along valleys carved by glaciers, through ancient rainforests and past cascading waterfalls. From May to late October, it can be cold and wet, with ice, snow and short daylight hours - only go if you have alpine, river crossing and navigation skills. ", location: 'Fiordland National Park ', difficulty: 'Intermediate', duration: '4 days', length: '53.5km', photo: 'https://www.doc.govt.nz/contentassets/364a29e2eedd4a09b5162143ecd01a14/milford-mackinnon-565.jpg')
# hike10 = Hike.create(title: 'Rakiura Track',
#                      description: 'Escape on an island adventure - relax and unwind in the peaceful surroundings with the bush, birds and beach at your side. ', location: 'Rakiura National Park ', difficulty: 'Intermediate', duration: '3 days', length: '32km', photo: 'https://www.doc.govt.nz/thumbs/gallery/globalassets/images/places/stewart-island-rakiura/rakiura-track/rakiura-track-people-bridge-90-seconds-1200.jpg')
# user1 = User.create(username: 'Admin', email: 'admin@example.com', password: 'password')
# list1 = user1.lists.create(name: 'NZ Great Walks',
#                            description: 'A list of all the great walks in New Zealand, I really wanna do every one!')
# list1.hikes << [hike1, hike2, hike3, hike4, hike5, hike6, hike7, hike8, hike9, hike10]

require 'rest-client'

doc_url = 'https://api.doc.govt.nz/v1/tracks'
data = JSON.parse(RestClient.get(doc_url, headers = { x_api_key: ENV['DOC_API_KEY'] }))
count = 0
puts data.length
data.each do |track|
  id = track['assetId']
  hike = JSON.parse(RestClient.get((doc_url + "/#{id}/detail?coordinates=wgs84"), headers = { x_api_key: ENV['DOC_API_KEY'] }))

  next if hike['walkDuration']&.empty? || hike['walkDurationCategory']&.empty?
  next if Hike.find_by(title: hike['name'])

  puts hike['name']
  # "https://www.doc.govt.nz/thumbs/large/link/6ea48e9fe21449d08f7574b556d7f059.jpg" needs to change to ../thumbs/hero/link...
  thumbnail = hike['introductionThumbnail'].gsub('large', 'hero')
  hike = Hike.create(title: hike['name'],
                     description: hike['introduction'],
                     location: hike['locationArray'].first,
                     difficulty: hike['walkTrackCategory'].first,
                     duration: hike['walkDuration'],
                     length: hike['distance'],
                     photo: thumbnail,
                     routeURL: hike['staticLink'],
                     duration_category: hike['walkDurationCategory'],
                     dog_friendly: hike['dogsAllowed'],
                     region: hike['region'],
                     coordinates: "#{hike['lat']}, #{hike['lon']}",
                    )
              count += 1
              puts "#{count} out of #{data.length} completed"
end
