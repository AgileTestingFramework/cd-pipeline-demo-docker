# Start a container
resource "docker_container" "jenkins" {
  name  = "jenkins-demo"
  image = "${docker_image.jenkins.latest}"
  volumes {
      host_path = "${var.jenkin_home_path}"
      container_path = "/var/jenkins_home"
  }
  ports {
      internal = 8080
      external = 8080  
  }

  ports {
      internal = 50000
      external = 50000  
  }
}

resource "docker_image" "jenkins" {
  name = "jenkins:2.46.2"
  keep_locally = "true"
}

# resource "docker_image" "sonarqube" {
#   name = "sonarqube:6.3.1"
#   keep_locally = "true"
# }

# resource "docker_image" "nexus" {
#   name = "sonatype/nexus3:3.3.1"
#   keep_locally = "true"
# }

# resource "docker_image" "postgres" {
#   name = "postgres:9.6.2"
#   keep_locally = "true"
# }

# Network
# resource "docker_network" "demo" {
#   name = "demo"
# }

