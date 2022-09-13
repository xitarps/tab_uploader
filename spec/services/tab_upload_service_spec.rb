require 'rails_helper'

RSpec.describe TabUploadService do
  subject { described_class.new('valid_text') }
  describe '.call' do
    context 'when has correct tab file' do
      let(:tab_test_file) { file_fixture('example_input.tab').read }
      let(:lines_without_header) { tab_test_file.lines.count - 1 }
      it 'generates purchase and history successfully' do
        TabUploadService.call(tab_test_file)

        expect(Purchase.count).to be_eql(lines_without_header)
        expect(UploadSalesHistory.count).to be_eql(1)
      end
      it 'returns correct amount' do
        human_sum_check = 102.95
        TabUploadService.call(tab_test_file)
        result = TabUploadService.call(tab_test_file)

        expect(human_sum_check).to be_eql(result[:uploads_values][:file_gross_income].to_f)
        expect(UploadSalesHistory.first.total_gross_income).to be_eql(result[:uploads_values][:file_gross_income])
        expect(UploadSalesHistory.sum(:total_gross_income)).to be_eql(result[:uploads_values][:total_gross_income])
      end
    end

    context 'when has incorrect tab file' do
      it 'doesn\'t generates purchase' do
        tab_test_file = file_fixture('example_input_wrong_data.tab').read
        lines_without_header = tab_test_file.lines.count - 1

        expect { TabUploadService.call(tab_test_file) }.to raise_error(TypeError)
        expect(Purchase.count).not_to be_eql(lines_without_header)
        expect(UploadSalesHistory.count).not_to be_eql(1)
      end
    end
  end

  describe '#utf8_encode' do
    context 'when has correct file type' do
      it 'execute encode successfully' do
        subject.send(:utf8_encode, "title\tname\tage\ntitulo\tnome\t23\r")
      end
    end
    context 'when has incorrect file type' do
      it 'execute encode successfully replacing wrong chars' do
        subject.send(:utf8_encode, "\x80")
      end
    end
  end
end
