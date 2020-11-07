class Shelf < ApplicationRecord
  validates :user_id, {presence: true}
  validates :image_url, {presence: true}
  validates :title, {presence: true}
  scope :finish_on_between, -> from, to{
    if from.present? && to.present?
      where(finish_on: from..to)
    elsif from.present?
      where("finish_on >= ?", from)
    elsif to.present?
      where("finish_on <= ?",to)
    end
  }
end
