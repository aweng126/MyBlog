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


  def show
    @categories=Category.all
  end

   def edit
     @category=Category.find_by_id(params[:id])
   end


  def update
    @category=Category.find_by_id(params[:id])
    @category.name=params[:category][:name]

    if@category.save
      render index
    else
      render edit
    end
  end


  def destroy

    pp"dddfddd"
    pp params[:id]

    @category=Category.find_by_id(params[:id])
    @category.destroy
    render index
  end
end




private
def category_params
  params.require(:category).permit(:name)
  # pp params
end