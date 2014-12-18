require_relative '../data/crm.rb'
require 'pp'

final_array = []
CRM[:companies].each do |company|
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      if employment[:company_id] == company[:id]
        hash = {}
        hash[:company_id] = company[:id]
        hash[:company_name] = company[:name]
        hash[:person_id] = person[:id]
        hash[:person_first_name] = person[:first_name]
        hash[:person_last_name] = person[:last_name]
        hash[:title] = employment[:title]
        final_array << hash
      end
    end
  end
end

pp final_array
