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
class StudentSection < ApplicationRecord
  belongs_to :section
  belongs_to :student

  validates :section, uniqueness: { scope: :student }
end
