class AllService < ActiveRecord::Base
    def self.all_category 
        #find unique categories
        return AllService.select(:category).distinct[1..-1]
    end

    def self.top_services
        return AllService.all.sort_by(&:count).reverse[0..3]
    end

end
