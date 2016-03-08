class Cue < ActiveRecord::Base
  belongs_to :show
  default_scope -> {order(number: :asc)}
  validates :number, presence: true, uniqueness: {scope: :show}
end
