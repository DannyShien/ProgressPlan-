class HomeController < ApplicationController
  before_action :require_login

  def index
    #@posts = current_user.posts
  end
end
