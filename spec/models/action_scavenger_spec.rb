require 'rails_helper'

describe ActionScavenger do
  it 'creates an associated ActionStub when creating an ActionScavenger' do
    scavenger = ActionScavenger.create(team: true, start_msg: 'get ready', complete_msg: 'congrats', name: 'Scavenger Hunt Party', description: 'Cool Party', amt: 19.99, enabled: false)

    expect(scavenger.start_msg).to eq 'get ready'
    expect(scavenger.complete_msg).to eq 'congrats'
    expect(scavenger.team).to eq true

    expect(scavenger.action_stub.name).to eq 'Scavenger Hunt Party'
    expect(scavenger.action_stub.enabled).to eq false
    expect(scavenger.action_stub.description).to eq 'Cool Party'
    expect(scavenger.action_stub.as_action_stub_type).to eq 'ActionScavenger'
  end
end
