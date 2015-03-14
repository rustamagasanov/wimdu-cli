class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /(?:\+?|\b)[0-9]{10}\b/
      record.errors[attribute] << (options[:message] || "is not a phone, format: +1234567890")
    end
  end
end
