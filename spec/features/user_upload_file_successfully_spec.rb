# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User' do
  describe 'upload file' do
    let(:tab_test_file){ file_fixture("example_input.tab")}
    context 'when correct file' do
      it 'success' do
        result = TabUploadService.call(tab_test_file.read )
        upload_value = result[:uploads_values][:file_gross_income]
        all_uploads_value = result[:uploads_values][:total_gross_income]

        visit root_path
        click_on :Upload

        attach_file 'Select File:', tab_test_file

        click_on :Salvar

        expect(page).to have_content(upload_value)
        expect(page).to have_content(all_uploads_value)
        expect(page).to have_content('Total do upload')
      end
    end

    context 'when no file' do
      it 'failure' do
        result = TabUploadService.call(tab_test_file.read )
        upload_value = result[:uploads_values][:file_gross_income]
        all_uploads_value = result[:uploads_values][:total_gross_income]

        visit root_path
        click_on :Upload

        click_on :Salvar

        expect(page).not_to have_content(upload_value)
        expect(page).not_to have_content(all_uploads_value)
        expect(page).not_to have_content('Total do upload')
        expect(page).to have_content('Error on file upload')
      end
    end
  end
end
