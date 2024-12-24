class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start, presence: true
  validates :end, presence: true
  validates :memo, length: { maximum: 500 }
  validate :start_end_check

  def start_end_check
    if self.start.present? && self.end.present?
      errors.add(:end, "は開始日より前の日付は登録できません。") unless self.start < self.end
    end
  end
end
