# frozen_string_literal: true

RSpec.describe Web::Views::Sites::Edit, type: :view do
  let(:exposures) { Hash[format: :html] }
  let(:template) do
    Hanami::View::Template.new('apps/web/templates/sites/edit.html.haml')
  end
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end
end
