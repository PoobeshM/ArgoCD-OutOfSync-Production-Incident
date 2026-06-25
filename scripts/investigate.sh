#!/bin/bash
argocd app diff payment-service
kubectl describe deployment payment-service
kubectl get events
git log --oneline
