class Task < ApplicationRecord
  belongs_to :goal
  

  has_many :likes, as: :item

  def toggle!
    if completed
      update completed: nil
    else
      update completed: Date.today
    end
  end

  def completed?
    !!completed
  end
end
