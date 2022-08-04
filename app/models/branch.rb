require 'json'

class Branch < ActiveRecord::Base
    # From model, get all the branch names in an array called locations
    def self.all_locations
        return Branch.order(:branch).pluck(:branch)[..-2]
    end

    def self.all_locations_name
        return Branch.order(:branch).pluck(:branch_name)[..-2]
    end

    def self.all_durations
        branch_time_dict = {}
        Branch.all.drop(1).each do |row|
            branch_time_dict[row.branch_name] = row.wait_time
        end
        return branch_time_dict.to_json
    end

    def self.full_branch(branch)
        #takes in branch keyword (Kovan/TampinesOne etc)
        #returns as DBS Kovan Branch/ DBS Tampines One Branch
        if branch != nil
            bank_name = Branch.where(branch: branch).select(:bank).first.bank
            branch_name = Branch.where(branch: branch).select(:branch_name).first.branch_name
            return bank_name + " " + branch_name
        else
            return branch
        end
    
    end
end