class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :another_user, only: [:edit, :update]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
    redirect_to category
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)
    product.user = current_user

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def another_user
    if self.product.user != current_user
      redirect_to category_product_url(category, product), flash: { error: 'You are not allowed to edit this product.' }
    end
  end
end
