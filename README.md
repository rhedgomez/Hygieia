<h1 style="color: #5e9ca0;">Hygieia - A DevOps&nbsp;Dashboard</h1>
<h2 style="color: #2e6c80;">Essentials:</h2>
<ul>
<li>Terraform greater than 0.11.7+(for provisioning AWS EC2 Instances)<br />-current version used: Terraform v0.11.8</li>
<li>Ansible greater than: 2.7.0+(for configuration management)<br />-current version used: Terraform v0.11.8</li>
<li>Docker, Docker-Compose, Docker-Swarm<br />-current version used are&nbsp;as follows:v<em>1.13.1, build 092cba3</em>, <em>1.21.2, build a133471,1.21.0, build 5920eb0</em><br /><br /></li>
</ul>
<h2 style="color: #2e6c80;">Installation Steps:</h2>
<ol>
<li>Fork Capitalone's&nbsp;repo going to your own GitHub repo&nbsp;
<ul>
<li><a href="https://github.com/capitalone/Hygieia">https://github.com/capitalone/Hygieia</a></li>
<li>
<div>On AWS, click on the link below to follow instructions below(exporting environment variables)</div>
<ul>
<li><a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-environment.html">https://docs.aws.amazon.com/cli/latest/userguide/cli-environment.html</a></li>
</ul>
</li>
</ul>
</li>
<li>Generate a key-pair for user authentication
<ul>
<li>The simplest way to generate a key pair is to run&nbsp;<strong>ssh-keygen</strong></li>
<li>Upload it to your AWS region using <strong>Ansible:</strong>
<ul>
<li><img src="https://drive.google.com/uc?id=1pOXsxUWTBg7afGFxkgO6gOUAVUpSZpSV" alt="upload-sshkeypair" width="477" height="188" /></li>
</ul>
</li>
</ul>
</li>
<li>Provision AWS instances(2) using Terraform(IaC)&nbsp;
<ul>
<li>jenkins_master_server_centos - where jenkins is installed</li>
<li>swarm_docker_server_centos - where Hygieia App is deployed and also implemented using Docker Swarm(for high availability).</li>
</ul>
</li>
<li>Setup the following Pipelines on Jenkins(in-order)
<ul>
<li>GIT SCM CHECKOUT</li>
<li>MVN PACKAGE &amp; BUILD IMAGE</li>
<li>PUSH DOCKER IMAGES - TO DOCKER HUB</li>
<li>RUN THE CONTAINERS<br /><br /></li>
</ul>
</li>
</ol>
<p><img src="https://drive.google.com/uc?id=190ObQqb7NkejX9DYWcd5VwHFHdsl75WJ" alt="JenkinsFile" width="969" height="534" /></p>
<p><strong>NOTE:<br /> </strong>To configure your environment, create a&nbsp;docker-compose.override.yml. The most commonly used properties are listed and the uncommented properties are mandatory for the collector to work:</p>
<div>&nbsp;</div>
<div>&nbsp;</div>
