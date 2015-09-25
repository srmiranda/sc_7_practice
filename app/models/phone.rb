class Phone < ActiveRecord::Base
  belongs_to :manufacturer

  validates :battery, presence: true
  validates :year, presence: true
  validates :year, numericality: { only_integer: true }
  validates :year, numericality: { greater_than_or_equal_to: 2003 }
end
