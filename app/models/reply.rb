class Reply < ActiveRecord::Base
  resourcify
  include Authority::Abilities
  belongs_to :user
  belongs_to :board
  has_many :majors
end
