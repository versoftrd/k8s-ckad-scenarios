> Pods -> deployment

In Namespace `pluto` there is single Pod named `holy-api` . It has been working okay for a while now but Team Pluto needs it to be more reliable. Convert the Pod into a Deployment with 3 replicas and name holy-api. The raw Pod template file is available at
`opt/course/holy-api-pod.yaml`

In addition, the new Deployment should set `allowPrivilegeEscalation: false` for the security context on
 
Please create the Deployment and save its yaml under
`opt/course/holy-api-deployment.yaml`


