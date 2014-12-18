require_relative '../data/crm.rb'
require 'pp'

final_array = []
CRM[:companies].each do |company|
  final_hash = {}
  array = []
  final_hash[:name] = company[:name]
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      if employment[:company_id] == company[:id]
        hash = {}
        hash[:id] = person[:id]
        hash[:first_name] = person[:first_name]
        hash[:last_name] = person[:last_name]
        hash[:title] = employment[:title]
        array << hash
      end
    end
  end
  final_hash[:employees] = array
  final_array << final_hash
end
final_array

pp final_array
