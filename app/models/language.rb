class Language < ActiveRecord::Base
  has_many :demands

  has_many :profile_languages
  has_many :speakers, through: :profile_languages, source: :profile
end
