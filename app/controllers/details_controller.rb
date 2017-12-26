class DetailsController < ApplicationController
  before_action :set_detail, only: [:show, :edit, :update, :destroy]

  # GET /details
  # GET /details.json
  def index
    #@details = Detail.all.order('created_at DESC')
    @details = Detail.paginate(page: params[:page], per_page: 5)
  end

  def get_report
    @todays_details = Detail.where("created_at >= ?", Time.zone.now.beginning_of_day)
      if @todays_details.blank?
        flash[:alert] = "You have not made today's entry. Please make an entry now!"
        redirect_to new_detail_path and return
      end
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@todays_details, view_context)
        pdf.render_file "#{Rails.root}/lib/attachments/ramesh_daily_report.pdf"
        send_data pdf.render, filename: "#{Rails.root}/lib/attachments/ramesh_daily_report.pdf", type: "application/pdf",disposition: "inline"
      end
    end
    StoryMailer.daily_story.deliver_now
  end

  # GET /details/1
  # GET /details/1.json
  def show
  end

  # GET /details/new
  def new
    @detail = Detail.new
  end

  # GET /details/1/edit
  def edit
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(detail_params)
      if @detail.save
        flash[:success] = "Detail was successfully created!"
        redirect_to @detail
      else
        render 'new'
      end
  end

  # PATCH/PUT /details/1
  # PATCH/PUT /details/1.json
  def update
    if @detail.update(detail_params)
      flash[:success] = "Detail was successfully updated!"
      redirect_to detail_path(@detail)
    else
      render 'edit'
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
    @detail.destroy
    flash[:success] = "Detail was successfully destroyed!"
    redirect_to details_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_params
      params.require(:detail).permit(:shop_name, :cust_name, :phone, :address, :status, :date)
    end
end
