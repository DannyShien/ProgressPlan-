class Goal < ApplicationRecord
  validates :title, :due_date, presence: true

  belongs_to :user
  has_many :tasks

  def completion_rate
    (tasks.where("completed IS NOT null").count / tasks.count.to_f) * 100
  end
end
