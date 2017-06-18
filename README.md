## Instructions to use and deploy schedule sinatra app with DockerCloud to AWS

* Create repository and push to Github
* Create EC2 instance with IAM user in EC2 (tcp/22, tcp/2375, tcp/6783, udp/6783, tcp/7070)
* Launch instance, login with ssh and install DockerCloud agent
* Instructions for adding DockerCloud agent in DockerCloud - Nodes - Bring your own node
* Add repository that was created earlier in DockerCloud - Repositories
* Add Automated Build in DockerCloud - Repositories - Builds ( Autobuild On)
* Add Service using the Repository in DockerCloud and deploy to Node
* Add domain name
