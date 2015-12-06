class Project < ActiveRecord::Base
    belongs_to :company
    has_many :works
    has_many :users, :through => :works


    validates :name, length: {minimum: 5}
    validates :company, presence: true
    validates :default_rate, numericality: {only_integer: true, greater_than_or_equal_to: 50 }

    validates :slug, uniqueness: true

    scope :lowdefaultrate, -> { where ("default_rate < 100 ")}

    def to_s
      "#{name} (#{company})"
    end
end
