# frozen_string_literal: true

module Store
  def save(file_name)
    File.open(file_name, 'w') do |file|
      file.write(to_yaml)
    end
  end

  def load(file_name)
    File.file?(file_name) && !File.zero?(file_name) ? YAML.load_file(file_name) : {}
  end
end
