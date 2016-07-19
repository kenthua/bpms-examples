JBoss BPMS 6.1 CI/CD jenkins
===

Jenkins Jobs for a CI/CD scenario with JBoss BPMS 6.1, based on this particular [demo](https://vimeo.com/139751946)  

This is leveraging the built-in runtime of JBoss BPM Suite's business central.  In v6.2+, kie-server was introduced to allow you to deploy processes into the Intelligent Process Server.  If leveraging the kie-server, the api / URLs will be different.

jenkins_jobs - contains the exported job xml definition  

exported:  
    
    java -jar jenkins-cli.jar -s http://jenkins_host:port get-job <THE_JOB> > output.xml

imported:
    
    java -jar jenkins-cli.jar -s http://jenkins_host:port create-job <THE_JOB> < output.xml
    

### Sample URLs:
http://localhost:8080/business-central/rest/deployment/customer:evaluation:1.0/deploy
http://localhost:8080/business-central/rest/deployment/customer:evaluation:1.0/undeploy
http://localhost:8080/business-central/rest/runtime/customer:evaluation:1.0/process/customer.evaluation/start 
http://localhost:8080/business-central/rest/history/instance/1
    