class Reply < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :board
  has_many :majors
end
