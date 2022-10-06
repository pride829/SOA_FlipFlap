# frozen_string_literal: true

# Module that can be included (mixin) to take and output yml data
module YamlBuddy
  def take_yaml(yml)
    require 'yaml'
    @data = YAML.safe_load(yml)
  end

  def to_yaml
    require 'yaml'
    @data.to_yaml
  end
end
