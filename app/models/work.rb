class Work < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :hours, numericality: {only_integer: true, in: 0..8}
  validates :project, presence: true
  validates :user, presence: true
  validates :datetimeperformed, presence: true

  validate :date_cannot_be_in_the_future

  scope :fullday, -> { where("hours >=8") }

  def self.recentdays(numdaysago)
      since_date = Time.now - numdaysago.to_i.days
      where("datetimeperformed > '#{since_date}'")
  end

  #scope :recent, -> {where ("datetimeperformed > '#{Time.now - 7.days}'")}

  def date_cannot_be_in_the_future
      if (datetimeperformed.present? && datetimeperformed > Time.new)
          errors.add(:datetimeperformed, "date can't be in the future")
      end
  end

  def to_s
    "#{user}: #{datetimeperformed.strftime('%d/%m/%Y %H:%M')} - #{hours} hours"
  end
end
