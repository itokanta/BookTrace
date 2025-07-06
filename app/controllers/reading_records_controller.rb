class ReadingRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reading_record, only: [:show, :edit, :update, :destroy]
  
  def index
    @reading_records = ReadingRecord.public_records.includes(:user).order(finished_on: :desc)
    #:descは並べ替え、この場合は、読了日の新しい順に並び替え（一般的な昇順(asc)、その反対が降順(desc)）※https://qiita.com/__Wata16__/items/cce088bacebf3dfa07e1
  end

  def show
  end

  def new
    @reading_record = current_user.reading_records.build
  end

  def create
    @reading_record = current_user.reading_records.build(reading_record_params)
    
    if @reading_record.save
      redirect_to @reading_record, notice: '読書記録が正常に作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reading_record.update(reading_record_params)
      redirect_to @reading_record, notice: '読書記録が正常に更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reading_record.destroy
    redirect_to reading_records_url, notice: '読書記録が正常に削除されました。'
  end

  private

  def set_reading_record
    @reading_record = current_user.reading_records.find(params[:id])
  end

  def reading_record_params
    params.require(:reading_record).permit(:title, :author, :finished_on, :public)
  end
end
