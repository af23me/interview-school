# frozen_string_literal: true

module ActsAsReferenceNumber
  extend ActiveSupport::Concern

  included do
    before_validation(on: :create) do
      self.reference_number ||= SecureRandom.uuid
    end

    validates :reference_number, presence: true
  end
end
