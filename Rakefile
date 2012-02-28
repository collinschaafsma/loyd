#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Loyd::Application.load_tasks

begin
  require "rspec/core/rake_task"
  desc "Run specs"
  task :spec_fast do
    RSpec::Core::RakeTask.new(:spec_fast) do |t|
      t.pattern = './spec/fast/**/*_spec.rb'
    end
  end
  task :spec_slow do
    RSpec::Core::RakeTask.new(:spec_slow) do |t|
      t.pattern = './spec/slow/**/*_spec.rb'
    end
  end
  task :spec do
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.pattern = './spec/**/*_spec.rb'
    end
  end
rescue LoadError

end
