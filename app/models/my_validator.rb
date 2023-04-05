class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.name.starts_with? 'X'
      record.errors[:name] << 'Need a name starting with X please!'
    end
  end
end

class Person
  include ActiveModel::Validations
  validates_with MyValidator
end

=begin
Validator는 모델에 대한 전반적인 유효성 검증 로직을 정의하기 위해
다른 모델과의 관계에서 일어날 수 있는 유효성 검사
=end