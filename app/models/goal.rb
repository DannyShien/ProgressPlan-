class Goal < ApplicationRecord
  validates :title, :due_date, presence: true

  belongs_to :user
  has_many :tasks
  has_many :likes, as: :item

  def completion_rate
    if tasks.count == 0
      0
    else  
      ((tasks.where("completed IS NOT null").count / tasks.count.to_f) * 100).round
    end
  end
end
