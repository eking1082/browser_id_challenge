require_relative 'load'

csv_file = ARGV[0]
abort 'Usage: app.rb /path/to/csv/file' unless csv_file

app = App.new
rows = app.read_csv(csv_file)
app.process_rows(rows)
app.print_results
