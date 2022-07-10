class Branch < ActiveRecord::Base
    # From model, get all the branch names in an array called locations
    def self.all_locations
        locations = []
        Branch.select(:branch).distinct[1..-1].each do |row|
            locations.append(row.branch)
        end
        return locations
    end
    def self.all_locations_name
        locations_name = []
        Branch.select(:branch_name).distinct[1..-1].each do |row|
            locations_name.append(row.branch_name)
        end
        return locations_name
    end
end