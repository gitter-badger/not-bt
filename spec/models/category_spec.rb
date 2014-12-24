require 'rails_helper'

describe Category do
  it 'does not have valid name when nil' do
    category = Category.create(name: nil)
    expect(Category.all.count).to eql(0)
  end
  it 'has many reports' do
    category = Category.create(name: 'Streetlight')
    issue_one = Report.create(address: '33 Harrison Ave Boston, MA 02111' , description: 'Broken', category: category)
    issue_two = Report.create(address: '60 Harrison Ave Boston, MA 02111' , description: 'Super broken', category: category)

    expect(category.reports.count).to eql(2)
  end
end
