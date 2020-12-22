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

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

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




