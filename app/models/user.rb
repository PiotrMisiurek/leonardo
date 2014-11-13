class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :projects, dependent: :destroy
  has_many :working_hours, through: :projects
  has_many :tasks, through: :projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_working?
    working_hours.in_progress.present?
  end

  def current_working_hour
    if is_working?
      working_hours.in_progress.first
    end
  end
end
