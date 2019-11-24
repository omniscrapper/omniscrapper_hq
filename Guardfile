if `uname` =~ /Darwin/
  notification :terminal_notifier,
    activate: 'com.googlecode.iTerm2'
end

guard :rspec, cmd: 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})

  watch('spec/spec_helper.rb') { 'spec' }
  watch(%r{^spec/support/fabricators/.+_fabricator\.rb$}) { 'spec' }

  watch(%r{^apps/web/application\.rb$}) { 'spec/web' }

  watch(%r{^apps/web/controllers/(.+)/(.+)\.rb$}) do |m|
    "spec/web/controllers/#{m[1]}/#{m[2]}_spec.rb"
  end
end
