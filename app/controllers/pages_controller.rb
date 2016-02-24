class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  # GET /
  def default
    @page = Page.where(title: 'Home')
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :updated, :id)
    end
end
