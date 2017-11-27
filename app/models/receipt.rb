class Receipt < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :card
end
