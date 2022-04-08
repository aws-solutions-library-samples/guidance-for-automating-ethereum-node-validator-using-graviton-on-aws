# Automating Ethereum Node Validator deployment on AWS

[Ethereum](https://ethereum.org/) is a community-run technology that allows you to send cryptocurrency (ETH) to anyone for a fee. The [Beacon chain](https://ethereum.org/en/upgrades/beacon-chain/) (ETH2) is an upgrade to Ethereum that introduced a proof-of-stake concept to the Ethereum ecosystem. Staking in ETH2 is done by validators who perform actions such as attestations and block proposal activities to improve the Ethereum network’s security and scalability. Validators in turn are rewarded for the staking actions they perform. 

[Rocket Pool](https://rocketpool.net/) is a decentralized staking pool that supports the Beacon chain. Validators who wish to earn rewards for staking may use Rocket Pool to create their own validation nodes. These validation nodes may be run on [Amazon Elastic Compute Cloud](https://aws.amazon.com/pm/ec2/) (Amazon EC2) powered by [Graviton2](https://aws.amazon.com/pm/ec2-graviton/) processors. In this project, we introduce a [AWS Cloud Development Kit](https://aws.amazon.com/cdk/) (AWS CDK) app that simplifies the deployment of Rocket Pool on EC2.

- If this is your first time using AWS CDK then [follow these bootstrap instructions](https://docs.aws.amazon.com/cdk/v2/guide/bootstrapping.html).

- Install TypeScript globally for CDK

    `npm i -g typescript`


- If you are running these commands in Cloud9 or already have CDK installed, then skip this command

    `npm i -g aws-cdk`

- Clone the demo CDK application code

    `git clone https://github.com/aws-samples/cdk-rocketpool-validator-node`

- Change directory

    `cd cdk-rocketpool-validator-node`

- Install the CDK application

    `npm install`

- Deploy the CDK application

    `cdk deploy`

# Connecting to the instance using AWS Systems Manager Session Manager
You may use AWS Systems Manager Session Manager to create a SSH connection to your Rocket Pool node.

## General Documentation
* [AWS Systems Manager Session Manager documentation](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html)
* [Working with Session Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with.html)
* [Start a session using AWS CLI](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-sessions-start.html#sessions-start-cli)

## Create a session

* [Install the Session Manager plugin for the AWS CLI](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
* Connect to your instance via a terminal session: 
    
    `aws ssm start-session --target [instance id] --document-name SSM-RocketPoolConfiguration`

# Completing the installation
- Once you are conected you can run the following command to complete the rest of the installation. 

    `rocketpool service start`

- (Optional) If at any point you want to change your ETH1/ ETH2 clients you can run the following command. The default client for ETH1 is Geth and for ETH2 is Nimbus.

    `rocketpool service config`

- Please refer to the documentation on the rocketpool site at https://docs.rocketpool.net/guides/node/docker.html#configuring-the-smartnode-stack

# Monitoring with Grafana
Rocket pool comes with support for Grafana and has a pre-built dashboard for each of the ETH2 clients. You can login to Grafana by navigating your browser to:

`http://<your node IP>:<grafana port>` 

The Grafana port is configured to be 3100 by default. You may find additional information including default login credentials and instructions for importing dashboards in the [Setting up Grafana](https://docs.rocketpool.net/guides/node/grafana.html#enabling-the-metrics-server) section of the Rocket Pool documentation. 

# Cleanup

`cdk destroy CdkRocketpoolValidatorStack`

# License

This package depends on and may incorporate or retrieve a number of third-party software packages (such as open source packages) at install-time or build-time or run-time ("External Dependencies"). The External Dependencies are subject to license terms that you must accept in order to use this package. If you do not accept all of the applicable license terms, you should not use this package. We recommend that you consult your company’s open source approval policy before proceeding.

Provided below is a list of External Dependencies and the applicable license identification as indicated by the documentation associated with the External Dependencies as of Amazon's most recent review.

THIS INFORMATION IS PROVIDED FOR CONVENIENCE ONLY. AMAZON DOES NOT PROMISE THAT THE LIST OR THE APPLICABLE TERMS AND CONDITIONS ARE COMPLETE, ACCURATE, OR UP-TO-DATE, AND AMAZON WILL HAVE NO LIABILITY FOR ANY INACCURACIES. YOU SHOULD CONSULT THE DOWNLOAD SITES FOR THE EXTERNAL DEPENDENCIES FOR THE MOST COMPLETE AND UP-TO-DATE LICENSING INFORMATION.

YOUR USE OF THE EXTERNAL DEPENDENCIES IS AT YOUR SOLE RISK. IN NO EVENT WILL AMAZON BE LIABLE FOR ANY DAMAGES, INCLUDING WITHOUT LIMITATION ANY DIRECT, INDIRECT, CONSEQUENTIAL, SPECIAL, INCIDENTAL, OR PUNITIVE DAMAGES (INCLUDING FOR ANY LOSS OF GOODWILL, BUSINESS INTERRUPTION, LOST PROFITS OR DATA, OR COMPUTER FAILURE OR MALFUNCTION) ARISING FROM OR RELATING TO THE EXTERNAL DEPENDENCIES, HOWEVER CAUSED AND REGARDLESS OF THE THEORY OF LIABILITY, EVEN IF AMAZON HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. THESE LIMITATIONS AND DISCLAIMERS APPLY EXCEPT TO THE EXTENT PROHIBITED BY APPLICABLE LAW.

Rocket Pool - © Rocket Pool Pty Ltd.
- https://rocketpool.net/
- https://github.com/rocket-pool/rocketpool
- https://github.com/rocket-pool/rocketpool/blob/master/LICENSE (GPL-3.0)
