class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(PENDING APPROVED DENIED)}
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def approve!
    transaction do
      self.update(status: 'APPROVED')
    end
  end

  def deny!
    transaction do
      self.update(status: 'DENIED')
    end
  end

  private
  def overlapping_requests
    CatRentalRequest.where("cat_id = ?", self.cat_id)
    .where.not('id = ?', self.id)
    .where.not("end_date < ? or start_date > ?", self.start_date, self.end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:overlap] << "Cannot approve overlapping requests"
    end
  end

end
