JBoss BPMS 6.1 CI/CD jenkins
===

Jenkins Jobs for a CI/CD scenario with JBoss BPMS 6.1, based on this particular [demo](https://vimeo.com/139751946)  

These will change for JBoss BPMS 6.2+ with it's new Intelligent Process Server runtime (kie-server)  

jenkins_jobs - contains the exported job xml definition  

exported:  
    
    java -jar jenkins-cli.jar -s http://jenkins_host:port get-job <THE_JOB> > output.xml

imported:
    
    java -jar jenkins-cli.jar -s http://jenkins_host:port create-job <THE_JOB> < output.xml
    
    