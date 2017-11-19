class Univ < ActiveRecord::Base
  has_many :users
  has_many :replies
end
