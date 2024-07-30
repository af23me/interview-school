# frozen_string_literal: true

# This particular form is used to work with one model
# To work directly with model attributes use model_attributes
# To use attributes which have defaults values for reading use build method
class ProxyForm < BaseForm
  extend ActiveModel::Callbacks

  define_model_callbacks :create, :update

  attr_reader :model, :params

  def self.model_attributes(*attributes)
    attributes_setters = attributes.map { |attribute| "#{attribute}=" }
    delegate(*attributes, *attributes_setters, to: :model)
  end

  def self.model_relations(*attributes)
    setters = attributes.map { |attribute| "#{attribute}=" }
    attributes_setters = attributes.map { |attribute| "#{attribute}_attributes=" }
    delegate(*attributes, *attributes_setters, *setters, to: :model)
  end

  def initialize(model, params = {})
    @model = model
    @params = params
    super(params)
  end

  def assign_params(params)
    params.each do |field, value|
      public_send("#{field}=", value)
    end
  end

  validate :validate_model

  def validate_model
    return if @model.valid?

    @model.errors.messages.each do |field, messages|
      messages.each { |message| errors.add(field, message) }
    end
  end

  def _save
    saved = false
    callback_name = new_record? ? :create : :update
    model.class.transaction do
      run_callbacks callback_name do
        saved = @model.save
        raise ActiveRecord::Rollback unless saved
      end
    end
    saved
  end

  def new_record?
    id.blank?
  end

  def id
    @model.id
  end
end
