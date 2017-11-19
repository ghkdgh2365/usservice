class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :univ
  belongs_to :college
  belongs_to :major
  has_many :cards
  has_many :receipts
  has_many :replies
  has_many :boards
  has_many :asks
end
