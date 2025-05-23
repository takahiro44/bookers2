class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true

   # body: 空でない、最大200文字
   validates :body, presence: true, length: { maximum: 200 }
end
