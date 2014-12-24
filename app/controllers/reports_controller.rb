class ReportsController < ApplicationController
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
    @report = Report.new(report_params)
    if @report.save
      redirect_to report_path(@report), notice: "Report submitted successfully"
    else
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:address, :category_id, :description,
                                   :latiude, :longitude, :image)
  end
end
