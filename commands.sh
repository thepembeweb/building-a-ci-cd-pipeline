git clone https://github.com/thepembeweb/building-a-ci-cd-pipeline.git
cd building-a-ci-cd-pipeline
python3 -m venv ~/.building-a-ci-cd-pipeline
source ~/.building-a-ci-cd-pipeline/bin/activate
make all
az login
az webapp up -n udacity-flask-ml-app-test --sku F1 --location eastus
./make_predict_azure_app.sh
