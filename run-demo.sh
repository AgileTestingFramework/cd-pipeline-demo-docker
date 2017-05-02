#!/bin/bash
echo "Starting demo"

if [ -d "jenkins_home" ]
then
  echo "Removing old jenkins_home" 
  rm -rf jenkins_home
fi
mkdir -p jenkins_home
JENKINS_HOME_PATH=$(python -c "import os,sys; print os.path.abspath(sys.argv[1])" ./jenkins_home/)
cat > ./docker/gen_vars.tf <<- EOM
variable "jenkin_home_path" {
   default = "$JENKINS_HOME_PATH"
}
EOM

cd docker
terraform destroy -force
terraform apply
cd ..
sleep 1

#docker run --name jenkins-demo -p 8080:8080 -p 50000:50000 -v /Users/srufle/code/src/bitbucket.org/pureadrenalineconsulting/docker-demo/jenkins_home:/var/jenkins_home jenkins:2.46.2

