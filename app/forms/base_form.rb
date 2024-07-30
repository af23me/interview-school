# frozen_string_literal: true

class BaseForm
  include ActiveModel::Model
  include ActiveModel::Serialization

  define_model_callbacks :save
  define_model_callbacks :validation, only: [:before]

  class Error < StandardError
  end

  class RecordInvalid < Error
    def initialize(obj)
      super(obj.errors.full_messages.to_sentence)
    end
  end

  def initialize(params = {})
    assign_params(params)
  end

  def assign_params(params)
    params.each do |field, value|
      public_send("#{field}=", value)
    end
  end

  def attributes
    instance_values.with_indifferent_access
  end

  def _save
    false
  end

  def valid?(*args)
    run_callbacks :validation do
      super(*args)
    end
  end

  def save
    if valid?
      run_callbacks :save do
        _save
      rescue StandardError => e
        Rails.logger.error("ERROR_SAVE_FORM: #{e.message};\nBacktrace: #{e.backtrace}")

        errors[:base] << I18n.t(:internal_error)
        false
      end
    else
      false
    end
  end

  def save!
    save || (raise RecordInvalid, self)
  end
end
