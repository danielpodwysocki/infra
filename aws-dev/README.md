# aws-dev

An enviroment for developemnt purposes - it doesn't run any critical services,
it can be brought up and torn down at will.
 
The region variable value must be a region with at least 3 AZs - the vpc.tf file will create 3 subnets in the a,b,c availability zones.
