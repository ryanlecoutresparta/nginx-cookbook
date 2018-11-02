# # encoding: utf-8

# Inspec test for recipe nginx-cookbook::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package "nginx" do
  it { should be_installed }
end

describe service "nginx" do
  it { should be_running }
  it { should be_enabled }
end

describe port(80), :skip do
  it { should_not be_listening }
end
