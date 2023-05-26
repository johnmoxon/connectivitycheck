#!/usr/bin/ruby

require 'webrick'

server = WEBrick::HTTPServer.new(
  :ServerSoftware => nil,
  :BindAddress => '0.0.0.0',
  :Port => 80,
  :Logger => WEBrick::Log.new($stderr, WEBrick::Log::DEBUG),
  :AccessLog    => [
    [ $stdout, WEBrick::AccessLog::COMMON_LOG_FORMAT  ],
    [ $stdout, WEBrick::AccessLog::REFERER_LOG_FORMAT ],
    [ $stdout, WEBrick::AccessLog::AGENT_LOG_FORMAT   ],
  ]
)

server.mount_proc '/generate_204' do |req, res|
  res.body = ''
  res.status = 204
  res.keep_alive = false
end

trap(:INT){ server.shutdown }
server.start
