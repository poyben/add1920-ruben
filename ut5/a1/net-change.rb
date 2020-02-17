#!/usr/bin/env ruby

def menu
  puts '1 - DHCP'
  puts '2 - Static'
  puts '3 - Domestic'
input = gets.chop
if imput == '1'
  system('dhclient eth0')
elsif imput == '2'
  system('ip addr del dev eth0')
  system('ip addr add 172.19.26.31/16 dev eth0')
elsif imput == '3'
  system('ip addr del dev eth0')
  system('ip addr add 192.168.1.12/24 dev eth0')
else
  puts "Escoja una opción válida."
end
end
menu
