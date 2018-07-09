require_relative '../test_helper'

describe App do
  attr_reader :app, :csv_file

  before(:each) do
    @app      = App.new
    @csv_file = 'tests/test.csv'
  end

  describe 'read_csv' do
    it 'should read the csv file' do
      rows = app.read_csv(csv_file)
      rows.count.must_equal 11
    end
  end

  describe 'process_rows' do
    it 'should result in the correct number of people' do
      rows = app.read_csv(csv_file)
      app.process_rows(rows)
      app.people.count.must_equal 3
    end
  end
end
