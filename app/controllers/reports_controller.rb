class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @reports = Report.all.limit(10)
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = current_user.reports.new(report_params)
    if @report.save
      redirect_to report_path(@report), notice: "Report submitted successfully"
    else
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to @report, notice: 'Report was successfully updated.'
    else
      render :edit
    end
  end

  private

  def report_params
    params.require(:report).permit(:address, :category_id, :description,
                                   :latiude, :longitude, :image)
  end
end
