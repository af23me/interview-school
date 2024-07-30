# frozen_string_literal: true

# == Schema Information
#
# Table name: subjects
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Subject < ApplicationRecord
  has_many :teacher_subjects, dependent: :destroy
  has_many :teachers, through: :teacher_subjects

  accepts_nested_attributes_for :teacher_subjects, allow_destroy: true

  validates :title, presence: true
end