apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: nestjs-application2
  namespace: argocd
spec:
  destination:
    name: ''
    namespace: nestjs
    server: 'https://kubernetes.default.svc'
  source:
    path: ./CI
    repoURL: 'https://github.com/jhonathan-jsa/nestjs-demo.git'
    targetRevision: HEAD
  sources: []
  project: default