require 'yaml'
require 'csv'
require 'rubygems'
require 'active_record'
require 'pg'

File.open 'errors.log', 'w'

class String
	require 'rubygems'
	require 'active_support'

	def singular
		ActiveSupport::Inflector.singularize self
	end
end

ActiveRecord::Base.establish_connection(
	adapter: 'postgresql',
	database: 'properties',
	username: '',
	password: '',
	host: 'localhost'
)

class Assessment < ActiveRecord::Base
end

class Bill < ActiveRecord::Base
end

#############################################################
#																														#
#		FILE NAMING CONVENTION:																	#
#		 	FILENAMES MUST CONFORM TO ACTIVERECORD CONVENTIONS		#
#			i.e. 'bills.csv' will create instances of `Bill`			#
#																														#
#############################################################
csv_file = ARGV[0]
model = csv_file.split('.')[0].singular.capitalize

line_count = 0
headers = eval(model).attribute_names
print headers

File.read(csv_file).lines.each do |line|
	begin
		CSV.parse line do |row|
			print "#{line_count}..."

			if line_count == 0
	#			elsif line_count > 25
	#				exit
			else
				hash = Hash[headers.zip row]
				id = hash.delete 'id'
				record = eval(model).new hash
				record.id = id #FUCK ACTIVERECORD
				record.save
				print '...'
			end
			line_count += 1
		end
		puts "done"
	rescue Exception => e
		puts "ERROR!: #{e}"	
		File.open('errors.log', 'a') {|f| f.write "#{line_count}: #{e}\n"}
	end
end
