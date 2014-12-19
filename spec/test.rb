require 'rspec'
require 'rspec/autorun'
require_relative '../lib/crm_data'

RSpec.describe '#all_employments' do

  it 'will return an array of all the employments, including the person name,
  company name, person id, company id and title.' do
  input = {
    companies: [
      {
        id: 0,
        name: "Nicolas and Sons"
      }
    ],
    people: [
      {
        :id => 4,
        :first_name => "Frieda",
        :last_name => "Tess",
        :employments => [
          {
            :company_id => 0,
            :title => "Dynamic Data Specialist"
          }
        ]
      }
    ]
  }

  expected_result = [
    {
      :company_id => 0,
      :company_name => "Nicolas and Sons",
      :person_id => 4,
      :person_first_name => "Frieda",
      :person_last_name => "Tess",
      :title => "Dynamic Data Specialist"
    }
  ]

  expect(CrmData.new(input).all_employments).to eq(expected_result)
end

it 'returns an empty array when the input has no value for companies key' do
  input = {companies: []}

  expected_result = []

  expect(CrmData.new(input).all_employments).to eq(expected_result)
end

end

RSpec.describe '#employees_of_companies' do
  it 'will return an array of companies, and the people who work for them.' do
    input = {
      companies: [
        {
          id: 0,
          name: "Nicolas and Sons"
        }
      ],
      people: [
        {
          :id => 4,
          :first_name => "Frieda",
          :last_name => "Tess",
          :employments => [
            {
              :company_id => 0,
              :title => "Dynamic Data Specialist"
            }
          ]
        },
        {
          :id => 46,
          :first_name => "Elyse",
          :last_name => "Jensen",
          :employments => [
            {
              :company_id => 0,
              :title => "Human Directives Engineer"
            }
          ]
        }
      ]
    }
    expected_result =
    [
      {
        name: "Nicolas and Sons",
        employees: [
          {
            :id => 4,
            :first_name => "Frieda",
            :last_name => "Tess",
            :title => "Dynamic Data Specialist"
          },
          {
            :id => 46,
            :first_name => "Elyse",
            :last_name => "Jensen",
            :title => "Human Directives Engineer"
          },
        ]
      }
    ]

    expect(CrmData.new(input).employees_of_companies).to eq(expected_result)
  end

  it 'returns an empty array when the input has no value for companies key' do
    input = {companies: []}

    expected_result = []

    expect(CrmData.new(input).employees_of_companies).to eq(expected_result)
  end

end

RSpec.describe '#people_without_employments' do
  it 'return an array of all the people who have no employments.' do
    input = {
      companies: [
        {
          id: 0,
          name: "Nicolas and Sons"
        }
      ],
      people: [
        {
          :id => 4,
          :first_name => "Frieda",
          :last_name => "Tess",
          :employments => []
        },
        {
          :id => 46,
          :first_name => "Elyse",
          :last_name => "Jensen",
          :employments => [
            {
              :company_id => 0,
              :title => "Human Directives Engineer"
            }
          ]
        }
      ]
    }
    expected_result =
    [
      {
        :id => 4,
        :first_name => "Frieda",
        :last_name => "Tess"
      }
    ]

    expect(CrmData.new(input).people_without_employments).to eq(expected_result)
  end

  it 'The resulting hashes in the array should_not_ include the `:employments` key' do
    input = {
      companies: [
        {
          id: 0,
          name: "Nicolas and Sons"
        }
      ],
      people: [
        {
          :id => 4,
          :first_name => "Frieda",
          :last_name => "Tess",
          :employments => []
        },
        {
          :id => 46,
          :first_name => "Elyse",
          :last_name => "Jensen",
          :employments => [
            {
              :company_id => 0,
              :title => "Human Directives Engineer"
            }
          ]
        }
      ]
    }
    expected_result =
    [
      {
        :id => 4,
        :first_name => "Frieda",
        :last_name => "Tess",
        :employments => []
      }
    ]
    expect(CrmData.new(input).people_without_employments).to_not eq(expected_result)
  end
end

# RSpec.describe '#group_by_x' do
#   it 'returns a hash where the values are arrays of items, grouped by the :x key' do
#     input = [
#       {x: 1, y: 6},
#       {x: 5, y: 1},
#       {x: 5, y: 8},
#     ]
#
#     expected_result = {
#       1 => [ {x: 1, y: 6} ],
#       5 => [
#         {x: 5, y: 1},
#         {x: 5, y: 8},
#       ],
#     }
#
#     expect(group_by_x(input)).to eq(expected_result)
#   end
