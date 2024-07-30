# frozen_string_literal: true

# == Schema Information
#
# Table name: teachers
#
#  id               :bigint           not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  reference_number :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :teacher do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
