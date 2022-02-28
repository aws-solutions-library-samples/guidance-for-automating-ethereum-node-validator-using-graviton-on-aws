# Automating Ethereum Node Validator deployment on AWS

[Ethereum](https://ethereum.org/) is a community-run technology that allows you to send cryptocurrency (ETH) to anyone for a fee. The [Beacon chain](https://ethereum.org/en/upgrades/beacon-chain/) (ETH2) is an upgrade to Ethereum that introduced a proof-of-stake concept to the Ethereum ecosystem. Staking in ETH2 is done by validators who perform actions such as attestations and block proposal activities to improve the Ethereum network’s security and scalability. Validators in turn are rewarded for the staking actions they perform. 

[Rocket Pool](https://rocketpool.net/) is a decentralized staking pool that supports the Beacon chain. Validators who wish to earn rewards for staking may use Rocket Pool to create their own validation nodes. These validation nodes may be run on [Amazon Elastic Compute Cloud](https://aws.amazon.com/pm/ec2/) (Amazon EC2) powered by [Graviton2](https://aws.amazon.com/pm/ec2-graviton/) processors. In this project, we introduce a [AWS Cloud Development Kit](https://aws.amazon.com/cdk/) (AWS CDK) app that simplifies the deployment of Rocket Pool on EC2.

- If this is your first time using AWS CDK then [follow these bootstrap instructions](https://docs.aws.amazon.com/cdk/v2/guide/bootstrapping.html).

- Install TypeScript globally for CDK

    `npm i -g typescript`


- If you are running these commands in Cloud9 or already have CDK installed, then skip this command

    `npm i -g aws-cdk`

- Clone the demo CDK application code

    `git clone https://github.com/aws_samples/<TBD>`

- Change directory

    `cd <TBD>`

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

    `rocketpool service config`

- Please refer to the documentation on the rocketpool site at https://docs.rocketpool.net/guides/node/docker.html#configuring-the-smartnode-stack

# Cleanup

`cdk destroy CdkRocketpoolValidatorStack`
