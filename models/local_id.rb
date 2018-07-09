class LocalId
  attr_reader :type, :id
  attr_accessor :person_id

  def initialize(type, id)
    @type = type
    @id   = id
  end

  def pretty_print
    id_hash = {'id_type' => type, 'id' => id}
    puts "#{id_hash} => #{person_id}"
  end
end
