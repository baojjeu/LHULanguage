# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



moment = %w[早 午 晚]
week   = %w[日 一 二 三 四 五 六]

moment.each do |moment|
  week.each do |week|
    name = week + moment
    WeekTime.create(name: name)
  end
end

Language.create([
    { name: '美語'     , flag: 'us.png' },
    { name: '西語'     , flag: 'es.png' },
    { name: '繁中'     , flag: 'tw.png' },
    { name: '簡中'     , flag: 'cn.png' },
    { name: '日語'     , flag: 'jp.png' },
    { name: '韓語'     , flag: 'kr.png' },
    { name: '法語'     , flag: 'fr.png' },
    { name: '德語'     , flag: 'de.png' }
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