# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



moment = %w[Morning Afternoon Night]
week   = %w[Sun. Mon. Tue. Wed. Thur. Fri. Sat.]

moment.each do |moment|
  week.each do |week|
    name = week + moment
    WeekTime.create(name: name)
  end
end

Language.create([
    { name: 'English'     , flag: 'us.png' },
    { name: 'Spanish'     , flag: 'es.png' },
    { name: 'Traditional Chinese'     , flag: 'tw.png' },
    { name: 'Simplified Chinese'     , flag: 'cn.png' },
    { name: 'Japanese'     , flag: 'jp.png' },
    { name: 'Korean'     , flag: 'kr.png' },
    { name: 'French'     , flag: 'fr.png' },
    { name: 'German'     , flag: 'de.png' }
  ])


accounts = {
  email: ['baozi.rails@gmail.com', 'paotzu.wu@gmail.com', 'baojjeu@gmail.com'],
  password: 'qqq'
}

accounts[:email].each do |email|
  u = User.new email: email,
               password: accounts[:password],
               password_confirmation: accounts[:password]
  u.add_language(3)
  u.save
end

p "User: #{User.count}, Language: #{Language.count}"