# Setup Service Account
oc create -f deploy/service_account.yaml

# Setup RBAC
oc create -f deploy/role.yaml
oc create -f deploy/role_binding.yaml

# Setup the CRD
oc create -f deploy/crds/rbt.redhat.com_appservices_crd.yaml

# Deploy the app-operator
oc create -f deploy/operator.yaml

# Create an AppService CR
# The default controller will watch for AppService objects and create a pod for each CR
oc create -f deploy/crds/rbt.redhat.com_v1alpha1_appservice_cr.yaml
