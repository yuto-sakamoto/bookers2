class Book < ApplicationRecord
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  scope :created_day, -> (ymd) { where(created_at: Time.parse(ymd).all_day) }

end
