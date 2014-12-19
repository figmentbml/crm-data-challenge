class CrmData

  def initialize(crm)
    @crm = crm
  end

  def all_employments
    final_array = []
    @crm[:companies].each do |company|
      hash = {}
      hash[:company_id] = company[:id]
      hash[:company_name] = company[:name]
      @crm[:people].each do |person|
        person[:employments].each do |employment|
          if employment[:company_id] == company[:id]
            hash[:person_id] = person[:id]
            hash[:person_first_name] = person[:first_name]
            hash[:person_last_name] = person[:last_name]
            hash[:title] = employment[:title]
          end
        end
      end
      final_array << hash
    end
    final_array
  end

  def employees_of_companies
    final_array = []
    @crm[:companies].each do |company|
      final_hash = {}
      array = []
      final_hash[:name] = company[:name]
      @crm[:people].each do |person|
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
  end

  def people_without_employments
    array = []
    @crm[:people].each do |person|
      if person[:employments].empty?
        hash = {}
        hash[:id] = person[:id]
        hash[:first_name] = person[:first_name]
        hash[:last_name] = person[:last_name]
        array << hash
      end
    end
    array
  end

end
