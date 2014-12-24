require 'rails_helper'

RSpec.describe Report, :type => :model do
  it { should have_valid(:address).when('33 Harrison Ave, Boston, MA 02111') }
  it { should_not have_valid(:address).when(nil, '') }

  it 'belongs to report' do
    category = Category.create(name: 'Streetlight')
    issue = Report.create(address: '33 Harrison Ave Boston, MA 02111',
                          description: 'Broken', category: category)

    expect(issue.category).to eql(category)
  end

end
