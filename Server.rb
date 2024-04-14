# frozen_string_literal: true
require 'sinatra'
class Server
  def initialize
    super
  end

  def scan(path)
    root_path = {
      :index => "",
      :path => {}
    }
    no = 1
    programs = ""
    File.open(path=path, mode="r") do |file|
      file.each do |txt|
      puts txt
        programs += txt
      end
    end
    while programs.include? "\n"
      puts "Looping..."
      programs = programs.sub "\n", ","
    end
    puts programs
		programs_array = programs.split(",")
		puts programs_array.to_s

    programs_array.each do |program|
      edit_program = program
      program_array = program.chars
      mode = ""
      program_array.each do |word|
        if word == "="
          break
        else
          mode += word
        end
      end
      puts mode
      if mode.include? "index"
        #空白削除
        edit_program = edit_program.sub("#{mode}=", "")
        edit_program_array = edit_program.chars
        if edit_program_array[0] == " "
          edit_program_array.delete_at 0
        end
        index_path = ""
        edit_program_array.each do |word|
          index_path += word
        end

        puts "INDEX_PATH: " + index_path
        root_path[:index] = index_path
      elsif mode.include? "get "
        url_path = mode.sub("get ", "")
        file_path = edit_program.sub("#{mode}=", "")
        file_path_array = file_path.chars
        if file_path_array[0] == " " || file_path_array[0] == "　"
          file_path_array.delete_at 0
          file_path = ""
          file_path_array.each do |word|
            file_path += word
          end
        end

        # URL PATH SPACE DELETE
        url_path_array = url_path.chars
        len = url_path_array.length
        url_path_array.delete_at(len - 1)
        url_path = ""

        url_path_array.each do |word|
          url_path += word
        end
        root_path[:path]["/#{url_path}"] = file_path
        puts "URL_PATH: #{url_path}"
        puts "FILE_PATH: #{file_path}"
      end
    end
    root_path
  end
  def server_start root_path
    app = Sinatra.new do
      puts root_path.to_s
      get "/" do
        puts "INDEX: " + root_path[:index]
        send_file root_path[:index]
      end
      root_path[:path].keys.each do |web_path|
        get web_path do
          send_file root_path[:path][web_path]
        end
      end
    end
    app.run!
  end
end