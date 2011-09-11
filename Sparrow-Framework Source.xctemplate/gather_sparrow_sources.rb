#!/usr/bin/env ruby

SOURCE_ROOT = "../source/Sparrow-Framework/sparrow/src/Classes"
SPARROW_GROUP = "Sparrow-Framework source"

$ignoredfiles = []
$definitions = []
$nodes = []

def createDefinition(source, destination, group, exclude_from_targets)
	if exclude_from_targets then
		exclude = "\t<key>TargetIndices</key>\n\t<array />\n"
	else
		exclude = ""
	end

	fragment = ""
	fragment += "<key>#{destination}</key>\n"
	fragment += "<dict>\n"
	fragment += "\t<key>Group</key>\n"
	fragment += "\t<string>#{group}</string>\n"
	fragment += "\t<key>Path</key>\n"
	fragment += "\t<string>#{source}</string>\n"
	fragment += exclude
	fragment += "</dict>\n"

	return fragment
end

def createNode(destination)
	return "<string>#{destination}</string>\n"
end

def addFile(filename, exclude_from_targets)
	print("Adding file '#{filename}', excluding from targets? #{exclude_from_targets}\n")
	destination = File.join(SPARROW_GROUP, filename)
	$definitions.push(createDefinition(
		File.join(SOURCE_ROOT, filename),
		destination,
		SPARROW_GROUP,
		exclude_from_targets
	))
	$nodes.push(createNode(destination))
end

def ignoreFile(filename, reason)
	print("Ignoring #{filename}: #{reason}\n")
	$ignoredfiles.push("Ignored: #{filename}\nReason: #{reason}\n\n")
end

def processSources()
	print("Looking for sources in #{SOURCE_ROOT}\n")
	Dir.foreach(SOURCE_ROOT) {
		| filename |

		if filename == '.' or filename == '..' then
			# Silently ignore
		else
			case File.extname(filename)
			when '.h'
				addFile(filename, true)
			when '.m'
				addFile(filename, false)
			else
				ignoreFile(filename, "Unrecognised extension")
			end
		end
	}
end

def writeIterableToFile(filename, data)
	File.open(filename, "w") do |f|
		if data.length == 0 then
			f.puts('')
		else
			data.each {
				| line |
				f.puts(line)
			}
		end
	end
end

def outputDefinition(fragments)
	print("Writing #{fragments.length} defintions to definitions.xml\n")
	fragments.unshift("<!-- Writing #{fragments.length} definitions -->")
	writeIterableToFile("definitions.xml", fragments)
end

def outputNodes(fragments)
	print("Writing #{fragments.length} nodes to nodes.xml\n")
	fragments.unshift("<!-- Writing #{fragments.length} defintions -->")
	writeIterableToFile("nodes.xml", fragments)
end

def outputIgnored(ignored)
	print("Writing details about #{ignored.length} files to ignored.txt\n")
	writeIterableToFile("ignored.txt", ignored)
end

# Do stuff
processSources()
outputDefinition($definitions)
outputNodes($nodes)
outputIgnored($ignoredfiles)

print("Finished!\n")
