require_relative '../test_helper'

describe Person do
  attr_reader :person

  before(:each) do
    @person = Person.new(1)
  end

  describe 'add_local_id' do
    it 'should add a local_id' do
      local_id = LocalId.new(1, 'abc')
      person.add_local_id(local_id)

      person.local_ids.count.must_equal 1
      person.local_ids['1_abc'].must_be_instance_of LocalId
      person.local_ids['1_abc'].type.must_equal 1
      person.local_ids['1_abc'].id.must_equal 'abc'
    end
  end
end
