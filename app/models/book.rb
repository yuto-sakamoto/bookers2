class Book < ApplicationRecord
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  scope :created_today,     -> { where(created_at: Time.current.all_day) }
  scope :created_1days_ago, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2days_ago, -> { where(created_at: 2.day.ago.all_day) }
  scope :created_3days_ago, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_4days_ago, -> { where(created_at: 4.day.ago.all_day) }
  scope :created_5days_ago, -> { where(created_at: 5.day.ago.all_day) }
  scope :created_6days_ago, -> { where(created_at: 6.day.ago.all_day) }
end
