require 'github_api'
require "#{Dir.pwd}/config"

github = Github.new basic_auth: "#{USERNAME}:#{PASSWORD}"

github_gen = Github.new

repos = github_gen.repos.list 'AJLeonardi' #THIS DOES NOT DO WHAT I EXPECT, no idea where it's getting those repos from
repos.each do |repo|
	puts repo['name']
end

repos = github.repos.list 'AJLeonardi' #This returns my repos!
repos.each do |repo|
	puts repo['name']
end

repos = github.repos.list 'chrisvans' #this STILL returns my repos -- wtf??
repos.each do |repo|
	puts repo['name']
end

