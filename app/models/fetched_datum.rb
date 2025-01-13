class FetchedDatum < ApplicationRecord
  belongs_to :data_source
  belongs_to :dashboard

  validates :data, presence: true
  validates :fetched_at, presence: true
end
