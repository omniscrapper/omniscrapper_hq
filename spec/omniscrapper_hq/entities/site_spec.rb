# frozen_string_literal: true

RSpec.describe Site, type: :entity do
  it 'can be initialized' do
    site = Fabricate.build(:site, name: 'Hello')
    expect(site.name).to eq 'Hello'
  end
end
