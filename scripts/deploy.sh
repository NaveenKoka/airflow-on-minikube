#!/bin/bash
set -e

NAMESPACE="airflow"

echo "Creating namespace..."
kubectl create namespace $NAMESPACE || true

echo "Installing NGINX Ingress Controller..."
minikube addons enable ingress

echo "Deploying Airflow Helm Chart..."
helm upgrade --install airflow ./charts/airflow --namespace $NAMESPACE

echo "Waiting for pods to be ready..."
kubectl rollout status deployment airflow-webserver -n $NAMESPACE

echo "Done! Airflow should be accessible at: http://airflow.local"
