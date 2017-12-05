class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  
  belongs_to :univ
  belongs_to :college
  belongs_to :major
  has_many :cards, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :asks, dependent: :destroy
  has_many :comments, dependent: :destroy
  after_create :set_default_role, if: Proc.new { User.count > 1 }
  private

  def set_default_role
    add_role :user
  end
  
end
