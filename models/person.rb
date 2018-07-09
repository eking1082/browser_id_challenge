class Person
  attr_reader :local_ids, :id

  def initialize(id)
    @id        = id
    @local_ids = {}
  end

  def add_local_id(local_id)
    @local_ids["#{local_id.type}_#{local_id.id}"] = local_id
  end
end
