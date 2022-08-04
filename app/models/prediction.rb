require 'time'

class Prediction < ActiveRecord::Base
    def self.top_services(cdate, branch, number)
        #Branch: DBS XXXXX Branch
        #Round date to nearest day
        time = Time.at(cdate).utc
        time = time.next_day if time.hour >= 12
        ndate = time.beginning_of_day.to_i
        
        # drop repeat and column header 
        avail_dates = Prediction.distinct.pluck(:unixdate)[1..]

        if avail_dates.include? ndate #if dates can be found in db
            if branch != nil #if got branch
                results = Prediction.where(unixdate: ndate, branch_name: branch).order(prediction: :desc).pluck(:service).first(number)

                return results
            else
                return Prediction.where(unixdate: ndate, branch_name: 'Global').order(prediction: :desc).pluck(:service).first(number)
            end
        else
            #if dates cannot be found in db
            #return a the top 5 services based on DBS transaction data (Clean_txn.csv)
            return ['UPDATE CUSTOMER PARTICULARS',
                'UPDATE CUSTOMER PHONE',
                'ACCOUNT CLOSURE',
                'DEBIT CARD ISSUANCE',
                'DEBIT CARD REPLACEMENT'
                ]
        end
    end

end
