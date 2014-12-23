class ReportsController < ApplicationController

  def index
    @reports = Report.all.limit(10)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to reports_path, notice: "Report submitted successfully"
    else
      render :new
    end
  end

private

  def report_params
    params.require(:report).permit(:address, :category, :description, :latiude, :longitude)
  end
end
