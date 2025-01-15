class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :data_sources, dependent: :destroy # Ensures associated data sources are deleted when a user is deleted
  has_many :dashboards, dependent: :destroy # Ensures associated dashboards are deleted when a user is deleted

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
