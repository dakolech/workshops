class User < ActiveRecord::Base
  attr_accessor :admin

  validates :firstname, presence: true
  validates :lastname, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  def admin?
    self.admin
  end
end
