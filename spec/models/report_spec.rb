require 'rails_helper'

RSpec.describe Report, :type => :model do
  it { should have_valid(:address).when('33 Harrison Ave, Boston, MA 02111') }
  it { should_not have_valid(:address).when(nil,'') }

  it { should have_valid(:category).when('Streetlight') }
  it { should_not have_valid(:address).when(nil,'') }
end
