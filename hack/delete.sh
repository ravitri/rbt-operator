
# Cleanup
oc delete -f deploy/crds/rbt.example.com_v1alpha1_appservice_cr.yaml
oc delete -f deploy/operator.yaml
oc delete -f deploy/role.yaml
oc delete -f deploy/role_binding.yaml
oc delete -f deploy/service_account.yaml
oc delete -f deploy/crds/rbt.example.com_appservices_crd.yaml
