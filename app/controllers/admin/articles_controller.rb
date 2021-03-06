module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :set_current_menu

    def index
      @articles = Article.all
    end

    def show
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to [:admin, @article], notice: 'Notícia criada com sucesso.'
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to [:admin, @article], notice: 'Notícia atualizada com sucesso.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to admin_articles_url, notice: 'Notícia removida com sucesso.'
    end

    private
    def set_article
      @article = Article.find(params[:id])
    end

    def set_current_menu
      @current_menu = 'articles'
    end

    def article_params
      params.require(:article).permit(:title, :body, :description, :main_image_url)
    end
  end
end
