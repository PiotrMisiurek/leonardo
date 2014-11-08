class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :projects, dependent: :destroy
  has_many :working_hours, through: :projects
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
