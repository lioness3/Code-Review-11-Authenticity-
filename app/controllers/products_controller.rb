class ProductsController < ApplicationController

  def index
    @products = Product.all
    @product_selection = @products.name
    @usa = Product.usa
    @top = Product.three_most_recent
    @reviews = Review.all
    if @reviews.any?
      @popular_array = Review.most_popular.first
      @popular = Product.find(@popular_array[0])
    end
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
       flash[:notice] = "Your product was successfully added!"
      redirect_to products_path
    else
       flash.now[:alert]= "ooops!"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.all

    @products = Product.all
    @product_selection = @products.name
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end
end
