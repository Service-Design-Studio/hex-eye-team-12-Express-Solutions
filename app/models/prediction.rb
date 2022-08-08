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
            if branch != nil #Assigns var if branch exists
                find_branch = branch
            else
                find_branch = 'Global'
            end
            # Return top n services for branch
            predict_arr = Prediction.where(unixdate: ndate, branch_name: find_branch).order(prediction: :desc).pluck(:service).first(number)

             #check if "Account Closure" Exists: if true, replace with the (n+1)th suggested
            if predict_arr.include? 'ACCOUNT CLOSURE':
                predict_arr = predict_arr - ['ACCOUNT CLOSURE'] +  [Prediction.offset(number).where(unixdate: ndate, branch_name: find_branch).order(prediction: :desc).pluck(:service).first]
            end
            
            return predict_arr #array

        else
            #if dates cannot be found in db
            #return a the top 5 services based on DBS transaction data (Clean_txn.csv)
            default_arr = ['UPDATE CUSTOMER PARTICULARS',
                'UPDATE CUSTOMER PHONE',
                'FUND TRANSFER',
                'DEBIT CARD ISSUANCE',
                'DEBIT CARD REPLACEMENT'
                ]

            return default_arr[..number-1]
        end
    end

end
