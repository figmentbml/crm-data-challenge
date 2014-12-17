require_relative '../data/crm.rb'
require 'pp'

result = []
CRM[:people].each do |person|
  person[:employments].each do |employment|
    result << employment[:title]
  end
end
result
pp result
