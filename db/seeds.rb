# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# times = [
#   [ "Thứ hai", "Sáng" ],
#   [ "Thứ hai", "Chiều" ],
#   [ "Thứ hai", "Tối" ],
#   [ "Thứ ba", "Sáng" ],
#   [ "Thứ ba", "Chiều" ],
#   [ "Thứ ba", "Tối" ],
#   [ "Thứ tư", "Sáng" ],
#   [ "Thứ tư", "Chiều" ],
#   [ "Thứ tư", "Tối" ],
#   [ "Thứ năm", "Sáng" ],
#   [ "Thứ năm", "Chiều" ],
#   [ "Thứ năm", "Tối" ],
#   [ "Thứ sáu", "Sáng" ],
#   [ "Thứ sáu", "Chiều" ],
#   [ "Thứ sáu", "Tối" ],
#   [ "Thứ bảy", "Sáng" ],
#   [ "Thứ bảy", "Chiều" ],
#   [ "Thứ bảy", "Tối" ],
#   [ "Chủ nhật", "Sáng" ],
#   [ "Chủ nhật", "Chiều" ],
#   [ "Chủ nhật", "Tối" ]
# ]
#
# times.each do |day, free|
#   TimesFree.create( day: day, free_time: free )
# end

require 'csv'
address_text = File.read(Rails.root.join('lib/address.csv'))
address = CSV.parse(address_text)
records_to_import = address.map do |city, city_id, district, district_id, sub_district, sub_district_id|
  Location.new(city: city, city_id: city_id,district: district, district_id: district_id, sub_district: sub_district, sub_district_id: sub_district_id)
 end
 Location.import records_to_import
# CSV.foreach(Rails.root.join('lib/address.csv'), headers: true) do |row|

#   Location.create({
#     city: row[0],
#     city_id: row[1],
#     district: row[2],
#     district_id: row[3],
#     sub_district: row[4],
#     sub_district_id: row[5]

#   })
# end

subjects = [
  "Math",
  "English",
  "Japanese",
  "History",
  "Physiscs",
  "Physiscal Education",
  "Biology",
  "Chemistry",
  "Literature",
  "Geographic"
]

subjects.each do |s|
  Subject.create(name: s)
end
