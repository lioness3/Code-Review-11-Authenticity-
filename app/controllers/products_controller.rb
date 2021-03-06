class ProductsController < ApplicationController
  before_action :authorize, only: [:secret, :new, :create, :edit, :show, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def secret
  end
  def index
    @products = Product.all
    @product_selection = @products.name
    @usa = Product.usa
    @top = Product.three_most_recent
    @reviews = Review.all
    if @reviews
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
       flash[:alert]= "ooops!"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @review = @product.reviews
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
     flash[:notice] = " #{@product.name} was deleted!"
     @products = Product.all
    redirect_to '/'
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end
end
