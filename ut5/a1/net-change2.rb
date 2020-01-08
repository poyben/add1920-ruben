#!/usr/bin/env ruby

def show_menu
  print "=================================\n
CHange NETwork configuration (v2)\n
=================================\n
 r. Reset\n
 1. nc-classroom109\n
 2. nc-myhome\n

 Select option [Enter=exit]: "
input = gets.chop
end
def change_network
  input = show_menu
  if input == 'r'
    system('ifdown eth; ifup eth0')
  elsif input == '1'
    system('cp /home/ruben/Escritorio/nc-classroom109 /etc/sysconfig/network/ifcfg-eth0')
    system('ifdown eth0')
    system('ifup eth0')
  elsif input == '2'
    system('cp /home/ruben/Escritorio/nc-myhome /etc/sysconfig/network/ifcfg-eth0')
    system('ifdown eth0')
    system('ifup eth0')
  else
    puts "Escoja una opción válida."
  end
  end
  change_network
