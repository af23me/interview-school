# frozen_string_literal: true

# == Schema Information
#
# Table name: sections
#
#  id                 :bigint           not null, primary key
#  title              :string           not null
#  teacher_subject_id :bigint           not null
#  classroom_id       :bigint           not null
#  weekdays           :integer          default([]), not null, is an Array
#  start_at           :time             not null
#  end_at             :time             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Section < ApplicationRecord
  belongs_to :teacher_subject
  belongs_to :classroom
  has_one :teacher, through: :teacher_subject

  has_many :student_sections, dependent: :destroy
  has_many :students, through: :student_sections

  validates :title, :weekdays, :start_at, :end_at, presence: true
end
