class Admin::SessionsController < ApplicationController
  before_action :set_session, only: [ :destroy]

  # GET /sessions/new
  def new
    @session = Session.new
  end

  def create

    # p params[:name]
    # p params[:pass]

    # 需要进行进一步修改，搜索条件进行调整，通过name和pass一次搜索。
    @user=User.find_by_name(params[:name])
    if(@user.pass==params[:pass])
       redirect_to posts_path
    end

  end


  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.fetch(:session, {})
    end
end
