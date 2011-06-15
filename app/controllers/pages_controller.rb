require 'rubygems'
require 'logger'
require 'config/environment'
require 'net/telnet'
include Net
# working on this one
#require 'eventmachine'

class PagesController < ApplicationController
attr_accessor :stepper_control

  def home
    @title = " HOME PAGE DAR "
  end
  
  def foo
    @title = " FOO BAR DAR "
  end
  
  def dispense_sequence
    @sess = Net::Telnet::new("Host" => "192.168.0.145", "Telnetmode" => true)
    id = 1
    steps = 50
    transmit = [id,steps].pack('CS')
    @sess.puts transmit
    puts transmit.length
    puts transmit.unpack('CS')
    
    #ends session on arduino
    id = 0
    steps = 00
    cut = [id,steps].pack('CS')
    @sess.puts cut
    @sess.close
    
    render :nothing => true
    @sess.puts transmit
  end
  
  # used to control multiple steppers individually
  # this code is not utilized in v1.0 of the code base
  # allows for conrol of steppers on the individual level
  # from right here
  def step
    @sess = Net::Telnet::new("Host" => "192.168.0.145", "Telnetmode" => true)

    id = 1
    steps = 50
    trans = [id,steps].pack('CS')
    @sess.puts trans
    puts trans.length
    puts trans.unpack('CS')
    
    #ends session on arduino
    id = 0
    steps = 00
    cut = trans = [id,steps].pack('CS')
    @sess.puts cut
    @sess.close
    
    render :nothing => true
    
  end

  
end
