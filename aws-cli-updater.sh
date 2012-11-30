#!/bin/bash

CLI_LIST=./cli.list
CLI_FOLDER=~/AWS_CLI_TOOLS/
CLI_PROFILE=~/.aws_cli_tools

#Download archives
wget -i $CLI_LIST

#Create or clean CLI tools directory 
if [ -d $CLI_FOLDER ]; then
	rm -rf $CLI_FOLDER*;
   else
	mkdir $CLI_FOLDER;
fi

#Unarchive cli tools
unzip \*.zip -d $CLI_FOLDER


#Define folders
AWS_AUTO_SCALING_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep AutoScaling`
AWS_CLOUDFORMATION_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep AWSCloudFormation`
AWS_CLOUD_WATCH_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep CloudWatch`
EC2_AMITOOL_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep ec2-ami-tools`
EC2_API_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep ec2-api-tools`
AWS_ELB_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep ElasticLoadBalancing`
AWS_IAM_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep IAMCli`
AWS_RDS_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep RDSCli`
EC2_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep ec2-api-tools`
SERVICE_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep ElasticLoadBalancing`
AWS_CLOUDWATCH_HOME=$CLI_FOLDER`ls $CLI_FOLDER|grep CloudWatch`

#Building profile with environment variables
echo "export AWS_AUTO_SCALING_HOME=$AWS_AUTO_SCALING_HOME" > $CLI_PROFILE
echo "export AWS_CLOUDFORMATION_HOME=$AWS_CLOUDFORMATION_HOME" >> $CLI_PROFILE
echo "export AWS_CLOUD_WATCH_HOME=$AWS_CLOUD_WATCH_HOME" >> $CLI_PROFILE
echo "export EC2_AMITOOL_HOME=$EC2_AMITOOL_HOME" >> $CLI_PROFILE
echo "export EC2_API_HOME=$EC2_API_HOME" >> $CLI_PROFILE
echo "export AWS_ELB_HOME=$AWS_ELB_HOME" >> $CLI_PROFILE
echo "export AWS_IAM_HOME=$AWS_IAM_HOME" >> $CLI_PROFILE
echo "export AWS_RDS_HOME=$AWS_RDS_HOME" >> $CLI_PROFILE
echo "export EC2_HOME=$EC2_API_HOME" >> $CLI_PROFILE
echo "export SERVICE_HOME=$AWS_ELB_HOME" >> $CLI_PROFILE
echo "export AWS_CLOUDWATCH_HOME=$AWS_CLOUD_WATCH_HOME" >> $CLI_PROFILE
echo 'export PATH=$PATH'":$AWS_AUTO_SCALING_HOME/bin:$AWS_CLOUDFORMATION_HOME/bin:$AWS_CLOUDWATCH_HOME/bin:$EC2_API_HOME/bin:$EC2_HOME/bin:$AWS_ELB_HOME/bin:$AWS_IAM_HOME/bin:$AWS_RDS_HOME/bin">> $CLI_PROFILE


chmod +x $CLI_PROFILE

#Update profile
if [ `grep -c ".aws_cli_tools" ~/.bashrc` == 0 ]; then
	echo 'if [ -f "$HOME/.aws_cli_tools" ]; then
	. $HOME/.aws_cli_tools
fi'>> ~/.bashrc;
fi

# Cleaning
rm -rf *.zip

exit 0;
