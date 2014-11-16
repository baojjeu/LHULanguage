class Profile < ActiveRecord::Base

  GENDER = [:male, :female]
  enum gender: GENDER

  belongs_to :user
  has_many :profile_languages
  has_many :experienced_languages, through: :profile_languages, source: :language
end