# ArgoCD OutOfSync Production Incident

## Scenario
- Git Deployment replicas: 3
- Live Cluster replicas: 5
- ArgoCD Status: OutOfSync
- Health: Healthy

## Deploy
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f argocd/application.yaml

## Simulate Incident
kubectl scale deployment payment-service --replicas=5

## Investigate
argocd app diff payment-service

## Findings
- What changed? Replicas changed from 3 to 5.
- Who changed it? A manual kubectl change (verify with audit logs/events).
- Prevention? GitOps only, RBAC, ArgoCD selfHeal.
