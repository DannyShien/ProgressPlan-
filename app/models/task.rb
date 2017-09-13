class Task < ApplicationRecord
  belongs_to :goal

  has_many :likes, dependent: :destroy

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
