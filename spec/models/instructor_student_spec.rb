require 'rails_helper'

RSpec.describe InstructorStudent, type: :model do

  describe 'relationships' do
    it { should belong_to :student }
    it { should belong_to :instructor }
  end

end
