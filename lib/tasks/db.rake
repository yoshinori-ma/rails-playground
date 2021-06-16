namespace :db do
  desc 'migrate with ssh tunnel'
  task migrate_with_ssh_tunnel: :environment do
    gateway = Net::SSH::Gateway.new(
      'bastion-host',
      'bastion-user',
      port: 22,
      keys: ['~/.ssh/bastion-key.pem']
    )

    local_port = 3308
    gateway.open('db-host', 3306, local_port) do
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
    end
  end
end
