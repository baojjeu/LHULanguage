class Profile < ActiveRecord::Base

  enum gender: { male: 0, female: 1 }

  belongs_to :user
  has_many :profile_languages
  has_many :experienced_languages, through: :profile_languages, source: :language
end