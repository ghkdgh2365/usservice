class Ask < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :univ
end
