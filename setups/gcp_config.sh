## GCP credentials configuration

gcloud auth login}
# If the projects doesn's exist
gcloud projects create trim-diode-285601
gcloud config set project trim-diode-285601


# Create credentials
gcloud iam service-accounts create dsdemo
gcloud projects add-iam-policy-binding trim-diode-285601 --member "serviceAccount:gcp-credentials@trim-diode-285601.iam.gserviceaccount.com" --role "roles/owner"
gcloud iam service-accounts keys create gcp-credentials.json --iam-account gcp-credentials@trim-diode-285601.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS=/home/ec2-user/gcp-credentials.json