#!/bin/bash
kubectl scale deployment payment-service --replicas=5
kubectl get deploy payment-service
argocd app diff payment-service
