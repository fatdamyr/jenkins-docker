#Password for docker user is "tcuser"

Vagrant.require_version ">= 1.6.3"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "boot2docker"

  config.vm.box = "parallels/boot2docker"

  
  #Network Setup
  config.vm.network "forwarded_port", guest: 8080, host:8080
  
  #Mount shared folders to the docker host OS
  config.vm.synced_folder "./.jenkins", "/jenkins"

  config.vm.provision :docker do |d|
      
    # Load Jenkins master server
    # Port 8080 for the web UI
    # Port 5000 for slave communications
    # See https://registry.hub.docker.com/_/jenkins/
    # docker run -d --name jenkins-master -p 8080:8080 -p 5000:5000 -v /jenkins:/var/jenkins_home jenkins
    
    d.pull_images "jenkins:latest"
    d.run "jenkins-master",
      image: "jenkins:latest",
      args: "-p 8080:8080 -p 50000:50000 -v /jenkins:/var/jenkins_home jenkins"
      
  end
end