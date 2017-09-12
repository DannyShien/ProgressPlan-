class Goal < ApplicationRecord
  validates :title, :due_date, presence: true

  belongs_to :user

end
