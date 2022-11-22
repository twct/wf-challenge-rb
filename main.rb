require 'httpclient'
require 'ostruct'
require 'dotenv'
require 'json'

def visit(node, collection)
    puts 'Visiting node: %s' % node.id

    collection[node.id] = collection.fetch(node.id, 0) + 1

    if node.child_node_ids.length > 0
        child_node_ids = node.child_node_ids.join(',')
        nodes = get_nodes(child_node_ids)
        for node in nodes
            visit(node, collection)
        end
    end
end

def call_api(endpoint)
    client = HTTPClient.new
    content = client.get_content '%s/%s' % [ENV['API_ENDPOINT'], endpoint]
    
    return JSON.parse(content, object_class: OpenStruct)
end

def get_nodes(node_ids)
    return call_api('nodes/%s' % node_ids)
end

Dotenv.load('./.env')

collection = {}

root_node_id = '089ef556-dfff-4ff2-9733-654645be56fe'

nodes = get_nodes(root_node_id)

for node in nodes
    visit(node, collection)
end

sorted = collection.sort_by {|_k, v| v}

puts 'Unique IDs: %s' % collection.keys.length
puts 'Most common: %s, %s time(s)' % sorted[-1]