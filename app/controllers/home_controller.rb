class HomeController < ApplicationController
  before_action :load_sidebar

  def index
    @articles = Article.paginate(page: params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def load_sidebar
    @active_campaigns = Campaign.opened.to_display
    @inactive_campaigns = Campaign.closed.to_display
  end
end
