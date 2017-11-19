class Major < ActiveRecord::Base
  belongs_to :college
  has_many :users
end
