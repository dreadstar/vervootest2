require 'rails_helper'

describe ActionSimpleshare do
  it 'creates an associated ActionStub when creating an ActionSimpleshare' do
    share = ActionSimpleshare.create(display_msg: 'hey everyone', network_filter_list: 'my list', name: 'myShare', description: 'sharing is caring', amt: 19.99, enabled: false)

    expect(share.display_msg).to eq 'hey everyone'
    expect(share.network_filter_list).to eq 'my list'

    expect(share.action_stub.name).to eq 'myShare'
    expect(share.action_stub.enabled).to eq false
    expect(share.action_stub.description).to eq 'sharing is caring'
    expect(share.action_stub.as_action_stub_type).to eq 'ActionSimpleshare'
  end
end
