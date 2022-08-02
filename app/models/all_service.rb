

class AllService < ActiveRecord::Base
    def self.all_category 
        #find unique categories & return in asc order of category ID
        return AllService.order(:category_id).select(:category , :category_id, :cat_image_link).distinct[1..-1]
    end

    def self.top_services(today, branch)
        # return AllService.all.sort_by(&:count).reverse[0..2]
        # getting the list of top 5 services from the csv file based on the date and branch
       return PredictedService.select(today, branch).sort_by(&:predicted_services).reverse[0..4]


    end

    def self.services
        services = []
        AllService.select(:service).drop(1).each do |row|
            services.append(row.service)
        end
        return services
    end



end
