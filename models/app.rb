class App
  attr_reader :people, :local_ids

  def initialize
    @people    = {}
    @local_ids = {}
  end

  def read_csv(file_path)
    # assumes headers are formatted like 'local id X'
    csv = CSV.read(file_path)
    fields = csv.shift.map { |field| field.split(' ').last.to_i }
    csv.collect { |record| Hash[*fields.zip(record).flatten] }
  end

  def process_rows(rows)
    rows.each do |row|
      row.select! { |_, id| id.present? }
      next if row.count < 2

      existing_ids = get_existing_ids(row)
      case existing_ids.count
      when row.count # all ids already exist, do nothing
        next
      when 0 # no ids exist, create a person with each id
        ids = row_to_local_ids(row)
        person = create_person(ids)
        @people[person.id] = person
      else # 1 or more ids exist, find person and add new ids
        ids = row_to_local_ids(row)
        person = find_person(existing_ids.values.first)
        add_ids_to_person(person, ids)
      end
    end
  end

  def print_results
    local_ids.values.each(&:pretty_print)
  end

  private

  def get_existing_ids(row)
    row_ids = []
    row.each { |type, id| row_ids << "#{type}_#{id}" }
    local_ids.slice(*row_ids)
  end

  def create_person(ids)
    person = Person.new(people.count + 1)
    add_ids_to_person(person, ids)
    person
  end

  def find_person(local_id)
    people[local_id.person_id]
  end

  def add_ids_to_person(person, ids)
    ids.each do |id|
      id.person_id = person.id
      person.add_local_id(id)
    end
  end

  def row_to_local_ids(row)
    ids = []
    row.each { |type, id| ids << create_local_id(type, id) }
    ids.compact
  end

  def create_local_id(type, id)
    type_id = "#{type}_#{id}"
    return nil if local_ids[type_id]

    @local_ids[type_id] = LocalId.new(type, id)
  end
end
