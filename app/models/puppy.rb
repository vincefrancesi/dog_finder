class Puppy < ApplicationRecord
  belongs_to :website

  scope :today, -> { where(arel_table[:created_at].gt(Time.now.beginning_of_day)) }
end
