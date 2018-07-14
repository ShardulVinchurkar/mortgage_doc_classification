# Deployment Steps.
The web application was deployed on 2 cloud service providers as following:
### AWS:
1. Created an EC2 instance
2. Accessed the EC2 instance via SSH from Putty
3. Installed R base and R shiny server in EC2 instance
4. Transferred the R shiny app components
5. Used WinSCP to transfer R code base and data files from my local machine to EC2 instance
6.  Used the public DNS IPv4 provided by AWS to host the application

### Shinyapps.io:
1. Installed package ‘rsconnect’
2. Authorized the account by provided security credentials
3. Deployed the model on the server
4. Used the url provided by the service to up the web application.


