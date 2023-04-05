=begin
요구사항

1. 각 부서는 여러 개의 직원을 가질 수 있다.
2. 각 직원은 하나의 부서에만 속할 수 있다.
3. 각 직원은 여러 개의 프로젝트를 수행할 수 있다.
4. 각 프로젝트는 여러 명의 직원으로 구성될 수 있다.
5. 각 프로젝트는 하나의 클라이언트에 속할 수 있다.
=end

class Department < ApplicationRecord
  has_many :employees
end

class Employee < ApplicationRecord
  belongs_to :department
  has_many :assignments
  has_many :projects, through: :assignments
end

class Project < ApplicationRecord
  belongs_to :client
  has_many :assignments
  has_many :employees, through: :assignments
end

class Assignment < ApplicationRecord
  belongs_to :employee
  belongs_to :project
end

class Client < ApplicationRecord
  has_many :Projects
end