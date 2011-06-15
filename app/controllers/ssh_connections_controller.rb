require 'net/ssh'
require 'logger'

Net::SSH.start(
  'host', 'user',
  :host_key => "ssh-rsa",
  :encryption => "blowfish-cbc",
  :keys => [ "/tmp/temporary-key" ],
  :compression => "zlib"
) do |session|
  ...
end

