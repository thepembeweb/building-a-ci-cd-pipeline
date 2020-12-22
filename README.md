# Azure Infrastructure Operations Project: Building a CI/CD Pipeline

> This project demonstrates how to build a Github repository from scratch and create a scaffolding to assist in performing both Continuous Integration and Continuous Delivery. The project uses Github Actions along with a Makefile, requirements.txt and application code to perform an initial lint, test, and install cycle. Lastly the project will integrate Azure Pipelines to enable Continuous Delivery to Azure App Service.

![](azure-pipelines.png)

![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg)
![Python application test with Github Actions](https://github.com/thepembeweb/building-a-ci-cd-pipeline/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)

# Overview

This project demonstrates how to build a Github repository from scratch and create a scaffolding to assist in performing both Continuous Integration and Continuous Delivery. The project uses Github Actions along with a Makefile, requirements.txt and application code to perform an initial lint, test, and install cycle. Lastly the project will integrate Azure Pipelines to enable Continuous Delivery to Azure App Service.

## Project Plan

* [Trello board](https://trello.com/b/LirRms2w) 
* [Project plan](https://docs.google.com/spreadsheets/d/1nh8Js1f2Pm17IbPwdjDykV-pCO2gOOzg_EjWI1cFxTU/edit?usp=sharing)

## Architectural Diagram

![alt Architectural Diagram](screenshots/8-architecture-diagram.png)

## Getting Setup

### Dependencies
1. Create an [Azure Account](https://portal.azure.com)
2. Create an [Azure Pipelines Account](https://dev.azure.com/)
3. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
4. Install in your GitHub account [Azure Pipelines](https://github.com/marketplace/azure-pipelines)

### Instructions
1. Get necessary azure credentials needed for your deployment
    - Log onto to Azure Portal
    - Open Azure Cloud Shell
    - Create ssh-keys in Azure Cloud Shell
    - Upload ssh-keys to Github
    - Create a GitHub Repo
    - When the GitHub Repo has been created select the option 'Clone with SSH'
    - In Azure Cloud Shell Clone the source locally:
      ```sh
      $ git clone git@github.com:thepembeweb/building-a-ci-cd-pipeline.git
      $ cd building-a-ci-cd-pipeline
      ```    
    ![alt Project cloned into Azure Cloud Shell](screenshots/1-project-cloned-into-azure-cloud-shell.png)
    
2. Local Test
    - Setup a Virtual Environment
      ```sh
      $ python3 -m venv ~/.building-a-ci-cd-pipeline
      $ source ~/.building-a-ci-cd-pipeline/bin/activate
      ```    
    - Run make all to install dependencies in the virtual environment and run tests
      ```sh
      $ make all
      ```
      ![alt Make all output](screenshots/2-make-all-passing-tests.png)
      
    - Start the application in the local environment:
      ```
      python app.py
      ```
    - Open a separate Cloud Shell and test that the app is working:
      ```
      ./make_prediction.sh
      ```
      ![alt Make all output](screenshots/13-local-test.png)


3. Deploy the app to an Azure App Service
    - Create an App Service in Azure with the following command where you specify your app and resource group names
        ```
        az webapp up -n your-app-name -g your-resource-group
        ```
    ![alt Deploy app in Cloud Shell](screenshots/5-deploy-app-in-cloud-shell.png)
    - App Service running in Azure
    ![alt Deploy app in Cloud Shell](screenshots/11-project-running-on-azure-app-service.png)

4. Configure GitHub Actions
    - Enable GitHub Actions in the GitHub UI as shown [here](https://docs.github.com/en/free-pro-team@latest/actions/managing-workflow-runs/disabling-and-enabling-a-workflow)
    - Replace yml code with scaffolding
      ```bash
      name: Python application test with Github Actions

      on: [push]

      jobs:
        build:

          runs-on: ubuntu-latest

          steps:
          - uses: actions/checkout@v2
          - name: Set up Python 3.5
            uses: actions/setup-python@v1
            with:
              python-version: 3.5
          - name: Install dependencies
            run: |
              make install
          - name: Lint with pylint
            run: |
              make lint
          - name: Test with pytest
            run: |
              make test
      ```
    - Verify remote tests pass in GitHub Actions UI
    ![alt Passing tests](screenshots/3-passing-github-actions-build.png)

    
4. Continuous Delivery on Azure
    - Log onto to Azure Portal
    - Open Azure Cloud Shell
    
5. Get necessary azure credentials needed for your deployment
    - Log onto to Azure Portal
    - Open Azure Cloud Shell




1. Get necessary azure credentials needed for your deployment
    - On your terminal do `az login`, the results will give your subscription id which is the id field in the ouput.
        ```
        [
            {
                "cloudName": "AzureCloud",
                "homeTenantId": "xxxxxxxxxxxxxxxxxxxx",
                "id": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                "isDefault": true,
                "managedByTenants": [],
                "name": "Free Trial",
                "state": "Enabled",
                "tenantId": "xxxxxxxxxxxxxxxxxxxxxxxxxxxx",
                "user": {
                "name": "xxxxxxx",
                "type": "user"
                }
            }
        ]

        ```
    - Create an azure service principal for terraform using the command below 
        ` az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"`. You should get an output similar to:
         ```
        {
            "client_id": "xxxxxxxxxxxxxxxxxxxx",
            "client_secret": "xxxxxxxxxxxxxxxxxxx",
            "tenant_id": "xxxxxxxxxxxxxxxxxxxxxxx"
        }

        ```

    - Create a resource group using the command
        ```
        az group create -n myResourceGroup -l eastus

        ```
 2. Create and Deploy virtual machine Image to Azure using Packer.
    Set the client_id, client_secret and tenant_id as environment variables or copy them into a file e.g packer-vars.json and run the following command to create and deploy your image to azure.
    
        packer build -var-file packer-vars.json server.json
        
 3. Customize terraform IaaS code and Deploy
    In the terrafom.tfvars file, the vm_count variable can be modified to the number of virtual machines you want created. By default, 2 VMs are created.
    Also, in this file, provide the client id, secret and other required information.
    Run the following commands to deploy your infrastructure:
    first you initialise your terraform state, then get the plan of the resources that are to be deployed and finally run the apply command to create those resources on azure
       
        $ terraform init
        $ terraform plan 
        $ terrafrom apply
        
 4. Destroy Infrastructure
    When you are done using the infrastructure, destroy it using the command
      
        terrafrom destroy     
    















* Project running on Azure App Service
![alt Project running on Azure App Service](screenshots/11-project-running-on-azure-app-service.png)

* Project cloned into Azure Cloud Shell
![alt Project cloned into Azure Cloud Shell](screenshots/1-project-cloned-into-azure-cloud-shell.png)

* Passing tests that are displayed after running the `make all` command from the `Makefile`
![alt Passing tests](screenshots/3-passing-github-actions-build.png)

* Output of a test run
![alt Output of a test run](screenshots/2-make-all-passing-tests.png)

* Successful deploy of the project in Azure Pipelines.
![alt Successful deploy of the project in Azure Pipelines](screenshots/10-successful-deploy-of-the-project-in-azure-pipelines.png)

* Running Azure App Service from Azure Pipelines automatic deployment
![alt Running Azure App Service from Azure Pipelines automatic deployment](screenshots/12-project-running-on-azure-app-service-auto-deployment.png)

* Successful prediction from deployed flask app in Azure Cloud Shell.  
![alt Successful prediction from deployed flask app in Azure Cloud Shell](screenshots/6-make-prediction.png)

* Output of streamed log files from deployed application
![alt Output of streamed log files from deployed application](screenshots/9-output-of-streamed-log-files-from-deployed-application.png)

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>

## Built With

* [Azure](https://portal.azure.com/) - Cloud service provider used
* [Python](https://www.python.org/) - The programming language used
* [Boston Housing](https://www.kaggle.com/c/boston-housing) - Kaggle Data source

## Authors

* **[Pemberai Sweto](https://github.com/thepembeweb)** - *Initial work* - [Building a CI/CD Pipeline](https://github.com/thepembeweb/building-a-ci-cd-pipeline)

## License

[![License](http://img.shields.io/:license-mit-green.svg?style=flat-square)](http://badges.mit-license.org)

- This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details
- Copyright 2020 © [Pemberai Sweto](https://github.com/thepembeweb).




