# demodeploy
So here's what I'd like for you to do:

Setup a public GitHub repo to store your Terraform code into
Create Terraform code that provisions a launch template and an EC2 instance based on the launch template. 
The launch template should create a t2.micro Ubuntu 22.04 EC2 instance. It's going to end up in both the DEV and the SQA AWS accounts. The only access into it should be SSH from just your IP address and 98.124.192.207/32. The userdata for the launch template should install any apt updates available for the OS, install node.js, and install the git-all metapackage. At the end of the userdata, trigger a reboot so any patches that get installed during the apt update get fully applied. Just write the infra for the DEV account but I'm interested to see if knowing it will eventually need to be deployed to SQA as well changes your development choices. 

Let me know if you have any questions or if you need access to an AWS account to use to develop against. And as I said, try to keep the work to 90 minutes at most. Good luck!
