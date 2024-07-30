# frozen_string_literal: true

# == Schema Information
#
# Table name: student_sections
#
#  id         :bigint           not null, primary key
#  section_id :bigint           not null
#  student_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :student_section do
    section { create(:section) }
    student { create(:student) }
  end
end
