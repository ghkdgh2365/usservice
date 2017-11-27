class Board < ActiveRecord::Base
  resourcify
  belongs_to :user
end
