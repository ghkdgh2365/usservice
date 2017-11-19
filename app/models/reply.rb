class Reply < ActiveRecord::Base
  belongs_to :board
  has_many :majors
end
