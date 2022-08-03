

class AllService < ActiveRecord::Base
    def self.all_category 
        #find unique categories & return in asc order of category ID
        return AllService.order(:category_id).select(:category , :category_id, :cat_image_link).distinct[1..-1]
    end

    def self.get_top_services(array)
        # getting the list of top 5 services matching the array passed in
        return AllService.where(service_id: array)

    end

    def self.services
        services = []
        AllService.select(:service).drop(1).each do |row|
            services.append(row.service)
        end
        return services
    end



end
