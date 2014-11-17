class User < ActiveRecord::Base

  # http://guides.rubyonrails.org/active_record_querying.html#joining-tables
  scope :good_at, -> (lang) {
    joins(profile: :experienced_languages).where(languages: { flag: "#{lang}.png" })
  }

  validates :email, :password, :password_confirmation, presence: true

  has_many :demands, dependent: :destroy
  has_many :demand_applications, class_name: 'DemandUser'
  has_many :notifications, dependent: :destroy

  # http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#M001834
  has_one :profile

  has_secure_password
  before_save :format_email!

  def format_email!
    email.downcase!
  end

  def already_apply_for?(demand)
    demand.applicants.include?(self)
  end

  def is_author_of?(demand)
    demands.include?(demand)
  end
end
