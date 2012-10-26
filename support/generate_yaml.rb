require 'yaml'
require 'csv'

csv_file = ARGV[0]

yaml_file =	csv_file.sub /csv/, 'yaml'

line_count = 0
headers = []

File.open yaml_file, 'w' do |file|
	File.read(csv_file).lines.each do |line|
		CSV.parse line do |row|
			print "#{line_count}..."

			if line_count == 0
				headers = row	
#			elsif line_count > 25
#				exit
			else
				file.puts Hash[headers.zip row].to_yaml
			end
			line_count += 1

			puts "done"
		end
	end
end
