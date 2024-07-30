# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id               :bigint           not null, primary key
#  first_name       :text             not null
#  last_name        :text             not null
#  reference_number :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Student < ApplicationRecord
  include ActsAsFullName
  include ActsAsReferenceNumber

  has_many :student_sections, dependent: :destroy
  has_many :sections, through: :student_sections

  validates :first_name, :last_name, presence: true
end
