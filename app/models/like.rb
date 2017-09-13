class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true

  has_many :likes, dependent: :destroy

  def user_name
    user.name
  end

end
