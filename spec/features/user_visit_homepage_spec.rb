# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User' do
  describe 'visit' do
    context 'homepage' do
      it 'successfully' do
        visit root_path

        expect(page).to have_content(I18n.t(:home))
      end
    end
  end
end
