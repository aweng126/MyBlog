class Admin::CategoriesController < ApplicationController
  def new
  end

  def create

    # params[:category].each do|key,value|
    #   puts key,':',value,'######'
    # end
    pp params[:name]
    @category=Category.new(category_params)
    if @category.save
    # 保存成功
      redirect_to controller: "admin/posts"
    end

  end

  def destroy
  end
end

private
def category_params
  params.require(:category).permit(:name)
  # pp params
end