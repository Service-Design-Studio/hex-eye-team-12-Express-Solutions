# require 'rails_helper'

# RSpec.describe "views with Categories", type: :view do
#   before(:all) do
#     AllService.create(:category => "Card", :category_int => 'ATM CARD REPLACEMENT', :service => 'Atm Card Replacement', :migratable => 'True', :count => '2500')
#   end
#   describe "when viewing the Main Page" do
#     it "should show Main Categories" do
#         service = AllService.find_by(:category => "Card")
#         byebug
#         # puts service
#         # visit services_path
#         expect(page).to have_content(service.category)
#     end 
#   end 
# end