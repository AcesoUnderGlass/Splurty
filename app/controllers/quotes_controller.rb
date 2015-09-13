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
    Quote.find(params[:id])
  end


  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

  def delete
    Quote.find(int).destroy
  end

  def destroy
    Quote.find(params[:id]).destroy
    redirect_to :index
  end
end