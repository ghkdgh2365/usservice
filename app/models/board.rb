class Board < ActiveRecord::Base
  resourcify
  include Authority::Abilities
  belongs_to :user
  has_many :replies
end
