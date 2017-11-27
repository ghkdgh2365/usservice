class Card < ActiveRecord::Base
  resourcify
  belongs_to :user
end
