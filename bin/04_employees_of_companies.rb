require_relative '../data/crm.rb'
require_relative '../lib/crm_data.rb'
require 'pp'

pp CrmData.new(CRM).employees_of_companies
