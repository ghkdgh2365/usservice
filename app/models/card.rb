class Card < ActiveRecord::Base
  resourcify
  include Authority::Abilities
  belongs_to :user
end
