# Load the rails application
require File.expand_path('../application', __FILE__)

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'leaf', 'leaves'
end

# Initialize the rails application
Storytree::Application.initialize!
