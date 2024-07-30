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
FactoryBot.define do
  factory :section do
    title { FFaker::Lorem.word }
    weekdays { [0, 2, 4] }
    classroom { create(:classroom) }
    teacher_subject { create(:teacher_subject) }
    start_at { Time.zone.parse('07:30') }
    end_at { Time.zone.parse('08:20') }
  end
end
