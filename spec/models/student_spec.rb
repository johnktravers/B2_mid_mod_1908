require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort_num }
    it { should validate_presence_of :age }

    it { should validate_numericality_of(:cohort_num).only_integer }
    it { should validate_numericality_of(:age).only_integer }

    it { should validate_length_of(:cohort_num).is_equal_to(4) }
  end
  
end
