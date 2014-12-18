require_relative '../data/crm.rb'
require 'pp'

array = []
CRM[:people].each do |person|
  if person[:employments].empty?
    hash = {}
    hash[:id] = person[:id]
    hash[:first_name] = person[:first_name]
    hash[:last_name] = person[:last_name]
    array << hash
  end
end

pp array
