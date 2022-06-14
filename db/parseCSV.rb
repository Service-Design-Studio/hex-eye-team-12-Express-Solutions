require 'csv'

table = CSV.read("Dummy_services.csv")
puts table
# table.each do |service|
#     Service.create!(service)
# end