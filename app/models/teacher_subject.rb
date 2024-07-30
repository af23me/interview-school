# frozen_string_literal: true

# == Schema Information
#
# Table name: teacher_subjects
#
#  id         :bigint           not null, primary key
#  teacher_id :bigint           not null
#  subject_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TeacherSubject < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  has_many :sections, dependent: :destroy

  validates :teacher, uniqueness: { scope: :subject }
end
