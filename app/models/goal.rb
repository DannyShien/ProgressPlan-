class Goal < ApplicationRecord
  validates :title, :due_date, presence: true

  belongs_to :user
  #belongs_to :waller_user, class_name: User

  has_many :tasks
  has_many :likes, as: :item

  def completion_rate
    if tasks.count == 0
      0
    else  
      ((tasks.where("completed IS NOT null").count / tasks.count.to_f) * 100).round
    end
  end

  def self.generate_goals(n = 5, user = nil, generate_mentions = true)
    user ||= User.last 
    n.times do
      goal = Goal.create(
        body: Faker::RickAndMorty.quote,
        # wall_user: user,
        poster: User.random_user
      )

      # rand(5).times do
      #   post.comments.create(
      #     body: Faker::MostInterestingManInTheWorld.quote,
      #     user: User.random_user
      #   )
      # end
    end
  end

end
