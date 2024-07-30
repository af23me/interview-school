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
FactoryBot.define do
  factory :teacher_subject do
    teacher { create(:teacher) }
    subject { create(:subject) }
  end
end
