require 'time'

class Prediction < ActiveRecord::Base
    def self.top_services(cdate, branch)

        #Round date to nearest day
        time = Time.at(cdate).utc
        time = time.next_day if time.hour >= 12
        ndate = time.beginning_of_day.to_i

        # services =[]
        if branch != nil
            return Prediction.where(unixdate: ndate, branch_name: branch).order(:prediction).select(:service).last(5)
        else
            # return Prediction.where(unixdate: ndate, branch_name: 'global').order(:prediction).select(:service).last(5)
            return Prediction.order(:prediction).where(unixdate: ndate, branch_name: 'global').select(:service).last(5)
        end
        
    end

end
