class Univ < ActiveRecord::Base
  has_many :users
  has_many :replies
  has_many :colleges, dependent: :destroy
  has_many :majors, dependent: :destroy
end
