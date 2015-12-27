class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "sashankg", password: "humanoid", except: [:index, :show]
	def new
		@article = Article.new
	end

	def show
		@article = Article.find(params[:id])
	end
	def create
		@article = Article.new(user_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	def index
		@articles = Article.all.sort_by { |article| article.created_at  }
	end

	private
	def user_params
		params.require(:article).permit(:title, :text)
	end
	def article_params
		params.require(:article).permit(:title, :text)
	end
end
