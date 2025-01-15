class DataSource < ApplicationRecord
  belongs_to :user
  has_many :fetched_data
end
