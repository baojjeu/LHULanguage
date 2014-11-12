class Profile < ActiveRecord::Base
  enum gender: { male: 0, female: 1 }
end
