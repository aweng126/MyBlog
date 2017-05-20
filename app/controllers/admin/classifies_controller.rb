class Admin::ClassifiesController < ApplicationController
  before_action :set_classify, only: [:show, :edit, :update, :destroy]

  # GET /classifies
  # GET /classifies.json
  def index
    @classifies = Classify.all
  end

  # GET /classifies/1
  # GET /classifies/1.json
  def show
  end

  # GET /classifies/new
  def new
    @classify = Classify.new
  end

  # GET /classifies/1/edit
  def edit
  end

  # POST /classifies
  # POST /classifies.json
  def create
    @classify = Classify.new(classify_params)

    respond_to do |format|
      if @classify.save
        format.html { redirect_to admin_classifies_path(@classify), notice: 'Classify was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end

  # PATCH/PUT /classifies/1
  # PATCH/PUT /classifies/1.json
  def update
    respond_to do |format|
      if @classify.update(classify_params)
        format.html { redirect_to admin_classifies_path(@classify), notice: 'Classify was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  # DELETE /classifies/1
  # DELETE /classifies/1.json
  def destroy
    @classify.destroy
    respond_to do |format|
      format.html { redirect_to admin_classifies_url, notice: 'Classify was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classify
      @classify = Classify.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classify_params
      params.require(:classify).permit(:name)
    end
end
