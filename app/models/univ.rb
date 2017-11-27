class Univ < ActiveRecord::Base
  has_many :users
  has_many :replies
  has_many :colleges
  has_many :majors
end
