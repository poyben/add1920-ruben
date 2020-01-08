#!/usr/bin/env ruby

option = ARGV[0]
filename = ARGV[1]

def check(as)
    status = `whereis #{as[0]} |grep bin |wc -l`.to_i
      if status == 0
        puts "#{as[0]} ->  (U) uninstalled"
      elsif status == 1
        puts "#{as[0]} ->  (I) installed"
      end
end

def install(as)
  status = `whereis #{as[0]} |grep bin |wc -l`.to_i
  action = "#{as[1]}".to_s

  if action == "install"
    if status == 0
      `apt-get install -y #{as[0]}`
      puts "#{as[0]} -> (I) installed"
    elsif status == 1
      puts "#{as[0]} -> ya está instalado"
    end

  elsif action == "remove"
      if status == 1
        `apt-get remove -y  #{as[0]}`
        puts "#{as[0]} -> (U) uninstalled"
      elsif status == 0
        puts "#{as[0]} -> no está instalado"
      end
  end
end

if option.nil?
    puts 'Se recomienda usar "--help" para visualizar ayuda útil.'

elsif option == '--help'
    print ("Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creacion.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:

        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove\n\n")

elsif option == '--option'
    puts 'Autor: Rubén González Sabina    Fecha: 08/01/20'

elsif option == '--status'
    f = `cat #{filename} `
    f_lines = f.split("\n")
    f_lines.each do |a|
      as = a.split(":")
      check(as)
    end

elsif option == '--run'
    user = `id -u`.to_i

    if user == 0
      f = `cat #{filename} `
      f_lines = f.split("\n")
      f_lines.each do |a|
        as = a.split(":")
        install(as)
      end
    elsif user != 0
      puts "Se necesitan permisos de usuario root para ejecutar el script"
      exit 1
    end
end
