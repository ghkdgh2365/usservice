class Board < ActiveRecord::Base
  resourcify
  belongs_to :user
  has_many :replies
end
