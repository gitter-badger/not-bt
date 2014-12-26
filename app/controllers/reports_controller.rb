class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @reports = Report.all.limit(10).order(updated_at: :desc)
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

  def correct_user
    @report = Report.find(params[:id])
    if @report.user != current_user
      redirect_to root_path, notice: "You may not edit a report you didn't post"
    end
  end
end
