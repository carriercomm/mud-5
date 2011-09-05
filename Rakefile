# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Mud::Application.load_tasks

namespace :mud do
  desc "Reset database, and load fixtures"
  task :reset => ['db:drop', 'db:migrate', 'db:fixtures:load']
end
