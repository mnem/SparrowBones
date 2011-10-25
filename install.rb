#!/usr/bin/env ruby

require 'time'
require 'fileutils'

TARGET_NAME = 'SparrowBones'
TARGET_DIR = File.join(ENV['HOME'], 'Library', 'Developer', 'Xcode', 'Templates')
FULL_TARGET = File.join(TARGET_DIR, TARGET_NAME)

def banner
	puts "----------------------------------------------------------------------"
	puts "     o-o                                    o--o                      " 
	puts "    |                                       |   |                     " 
	puts "     o-o  o-o   oo o-o o-o o-o o   o   o    O--o  o-o o-o  o-o o-o    " 
	puts "        | |  | | | |   |   | |  \\ / \\ /     |   | | | |  | |-'  \\     " 
	puts "    o--o  O-o  o-o-o   o   o-o   o   o      o--o  o-o o  o o-o o-o    " 
	puts "          |                                                           " 
	puts "          o                                                           " 
	puts "-------------------------[Install Script]-----------------------------"
	puts "Installing to:\n    '#{FULL_TARGET}'"
end

def confirm(question)
	while true
		puts question
		print "    [Yes/No] > "
		reply = gets.chomp.downcase

		if reply[0].chr == 'y'
			return true
		elsif reply[0].chr == 'n'
			return false
		end
	end
end

def check_for_existing
	puts "\n----------------------[Checking for existing]-------------------------\n\n"
	if File.exist?(FULL_TARGET)
		if confirm("'#{TARGET_NAME}' already exists. Do you want me to overwrite it?")
			backup = "#{FULL_TARGET}.#{Time.now.strftime('%Y-%m-%d_%H:%M:%S')}.tgz"
			puts "\nArchiving existing to:\n    #{backup}"
			cmd = "tar -cvz -C '#{TARGET_DIR}' -f '#{backup}' '#{TARGET_NAME}'"
			puts "\n#{cmd}"
			`#{cmd}`
			puts "\nDeleting #{FULL_TARGET}"
			if File.directory? FULL_TARGET
				FileUtils.remove_dir FULL_TARGET
			else
				File.delete FULL_TARGET
			end
			puts "Done"
		else
			abort("\n\nABORTING: Remove existing '#{FULL_TARGET}' and then run this script again to install.")
		end
	else
		puts "Looks like this is a first time install."
	end

	if !File.exist?(TARGET_DIR)
		puts "\nCreating user templates directory: #{TARGET_DIR}"
		FileUtils.mkdir_p TARGET_DIR
	end
end

def choose_xcode_version
	puts "I can't work out what version of Xcode you have."
	if confirm("Use the templates for Xcode 4.2?")
		puts ""
		return "4.2"
	elsif confirm("Use the templates for Xcode 4.1?")
		puts ""
		return "4.1"
	else
		puts ""
		return nil
	end
end

def get_xcode_version
	result = %x[xcodebuild -version]
	if result.match("Xcode 4.2")
		return "4.2"
	elsif result.match("Xcode 4.1")
		return "4.1"
	elsif result.match("Xcode 4.0")
		return "4.1"
	else
		return choose_xcode_version
	end
end

def create_link
	puts "\n---------------------[Creating template link]-------------------------\n\n"
	version = get_xcode_version
	if version
		puts "Linking to templates for Xcode #{version}"
		File.symlink(File.expand_path(File.join(File.dirname(__FILE__)), version), FULL_TARGET)
	else
		abort("\n\nABORTING: No valid Xcode version found.")
	end
end

def finished
	puts "\n----------------------------[Finished]--------------------------------\n\n"
	puts "You should now have a 'Sparrow Bones' template when you create a new\nproject in Xcode."
	puts "\nFor more information see https://github.com/mnem/SparrowBones\n\n"
end

banner
check_for_existing
create_link
finished
