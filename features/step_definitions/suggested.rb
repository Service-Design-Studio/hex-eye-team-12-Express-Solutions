Given /the date and time is "(.*), (.*), (.*), (.*), (.*), (.*)"?/ do |yyyy,mth,day,h,m,s|
    puts Time.current
    Time.zone = "Singapore"
    travel_to Time.zone.local(yyyy, mth, day, h, m, s)
    puts Time.current
end

require 'csv'
Given /the data in test_global_prediction.csv/ do
    # table is a Cucumber::MultilineArgument::DataTable
    predictions_table = CSV.read("features/step_csv/test_global_prediction.csv")
    predictions_table.each do |branch_name, service, unixdate, date, prediction|
        Prediction.create!(:branch_name => branch_name, 
                            :service => service,
                            :unixdate => unixdate,
                            :date => date,
                            :prediction => prediction
                            )
    end
end