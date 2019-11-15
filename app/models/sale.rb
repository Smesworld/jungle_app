class Sale < ActiveRecord::Base
  validate :end_after_start
  validates :name, :starts_on, :ends_on, presence: true


  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def self.percent_off
    select(:name, "max(#{:percent_off}) AS percent_off").where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).group(:name)
  end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

  private

  def end_after_start
    return if starts_on.blank? || ends_on.blank?
    
    if ends_on < starts_on
      errors.add(:end_date, "must be after the Start date")
    end
  end
end
