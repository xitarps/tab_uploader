# frozen_string_literal: true

# Controller made to handle tab files upload
class TabUploadController < ApplicationController
  def new; end

  def create
    file = params[:file]

    error = check_file_respond_to(file)
    return redirect_to new_upload_path, alert: error[:message] if error

    @upload_result = TabUploadService.call(file.read)

    redirect_to upload_path(@upload_result)
  end

  def show
    @upload_result = purchases_params
  end

  private

  def purchases_params
    params.require(:uploads_values).permit(:file_gross_income, :total_gross_income)
  end

  def check_file_respond_to(file)
    return nil if file.respond_to?(:read)

    Rails.logger.error "Bad file: #{file.class.name}: #{file.inspect}"
    { message: 'Error on file upload' }
  end
end
