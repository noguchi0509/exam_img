# server '3.113.72.205', user: 'app', roles: %w{app db web}
# set :ssh_options, keys: '/home/ubuntu/workspace/id_rsa'
server '3.113.186.64', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/ubuntu/workspace/id_rsa'
# set :ssh_options, keys: '/home/app/.ssh/id_rsa'