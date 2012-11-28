module Api
  module V1
    class ArticlesController < ApiController
      respond_to :json
      
      def index
        @articles = Article.order('published_at DESC').page(params[:page]).per(params[:per_page] || 10)
        
        response.headers["X-total"] = @articles.total_count.to_s
        response.headers["X-offset"] = @articles.offset_value.to_s
        response.headers["X-limit"] = @articles.limit_value.to_s
        
        respond_with @articles
      end

      def show
        respond_with Article.find(params[:id])
      end

      def create
        respond_with Article.create(params[:article])
      end

      def update    
        respond_with Article.update(params[:id], params[:article])
      end

      def destroy
        respond_with Article.destroy(params[:id])
      end
    end
  end
end