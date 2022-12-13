class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Product was successfully saved!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end