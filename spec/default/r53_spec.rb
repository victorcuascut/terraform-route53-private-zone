require 'awspec'

describe route53_hosted_zone('test.victorcuascut.io.') do
  it { should exist }
end
