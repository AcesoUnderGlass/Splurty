class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
	end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end
  
  def about
  end

  def show
    @quote = Quote.find(params[:id])    
  end

  def delete
    Quote.find(params[:id]).delete
    redirect_to :index
  end

  def destroy
    Quote.find(params[:id]).destroy
    redirect_to :index
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end