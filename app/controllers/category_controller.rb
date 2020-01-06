class CategoryController < ApplicationController
  def show
    @category = Category.find_by(params[:category_id])
  end
end
