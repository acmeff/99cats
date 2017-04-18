class Cat < ApplicationRecord
  validates :birth_date, :name, :description, presence: true
  validates :sex, presence: true, inclusion: { in: ["M", "F"] }
  validates :color, presence: true, inclusion: { in: %w(Purple Green Tie-Dye Orange)}

  COLORS = ["Purple", "Green", "Orange", "Tie-Dye"]

  def age
    today = Date.today
    bday = self.birth_date
    (today - bday).to_i/365
  end

  has_many :cat_rental_requests,
    dependent: :destroy



end
