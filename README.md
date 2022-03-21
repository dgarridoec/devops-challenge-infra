# devops-challenge-infra

Prerequisitos
-------------

gcloud auth login
PROJECT_NAME="devops-challenge-344619"
### crear proyecto gcp (debe tener habilitado facturacion en su cuenta)
gcloud projects create $PROJECT_NAME
gcloud config set project $PROJECT_NAME
gcloud config get-value project
gcloud services enable run.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable vpcaccess.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable containerregistry.googleapis.com
gcloud services enable servicenetworking.googleapis.com
gcloud iam service-accounts create cicd-service-account \
--description "cuenta de servicio para github actions" \
--display-name "cicd-service-account"

gcloud projects add-iam-policy-binding $PROJECT_NAME \
--member serviceAccount:cicd-service-account@$PROJECT_NAME.iam.gserviceaccount.com \
--role roles/editor 

gcloud projects add-iam-policy-binding $PROJECT_NAME \
--member serviceAccount:cicd-service-account@$PROJECT_NAME.iam.gserviceaccount.com \
--role roles/servicenetworking.networksAdmin

gcloud iam service-accounts keys create $(pwd)/terraform/service-account-key.json \
--iam-account cicd-service-account@$PROJECT_NAME.iam.gserviceaccount.com

### IInicializar dependecias de terraform
terraform init
terraform plan
terraform apply
