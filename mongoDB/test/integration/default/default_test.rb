# # encoding: utf-8

# Inspec test for recipe mongoDB::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# package is what is installed
describe package 'mongodb-org' do
  it { should be_installed}
  its('version') { should match /3\./ }
end

describe service('mongod') do
  it { should be_enabled }
  it { should be_started }
end

# test that checks what processes and addresses are running on this port
describe port(27017) do
  it {should be_listening}
  its('processes') {should include 'mongod'}
  its('addresses') {should include '0.0.0.0'}
end
