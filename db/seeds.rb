# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
times = [
  [ "Thứ hai", "Sáng" ],
  [ "Thứ hai", "Chiều" ],
  [ "Thứ hai", "Tối" ],
  [ "Thứ ba", "Sáng" ],
  [ "Thứ ba", "Chiều" ],
  [ "Thứ ba", "Tối" ],
  [ "Thứ tư", "Sáng" ],
  [ "Thứ tư", "Chiều" ],
  [ "Thứ tư", "Tối" ],
  [ "Thứ năm", "Sáng" ],
  [ "Thứ năm", "Chiều" ],
  [ "Thứ năm", "Tối" ],
  [ "Thứ sáu", "Sáng" ],
  [ "Thứ sáu", "Chiều" ],
  [ "Thứ sáu", "Tối" ],
  [ "Thứ bảy", "Sáng" ],
  [ "Thứ bảy", "Chiều" ],
  [ "Thứ bảy", "Tối" ],
  [ "Chủ nhật", "Sáng" ],
  [ "Chủ nhật", "Chiều" ],
  [ "Chủ nhật", "Tối" ]
]

times.each do |day, free|
  TimesFree.create( day: day, free_time: free )
end
