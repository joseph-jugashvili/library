# frozen_string_literal: true

module Store
  def add(entity)
    case entity
    when Author then @authors << entity
    when Book then @books << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    else
      raise("Your data doesn't belong to accessible entities. You can add only Author, Book, Reader or Order")
    end
  end

  def save(file_name)
    File.open(file_name, 'w') do |file|
      file.write(to_yaml)
    end
  end

  def load(file_name)
    File.file?(file_name) && !File.zero?(file_name) ? YAML.load_file(file_name) : {}
  end
end
