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
describe Teacher, type: :model do
  it 'has a valid factory' do
    expect(build(:teacher)).to be_valid
  end

  it 'not valid without first name' do
    expect(build(:teacher, first_name: nil)).not_to be_valid
  end

  it 'not valid without last name' do
    expect(build(:teacher, last_name: nil)).not_to be_valid
  end
end
