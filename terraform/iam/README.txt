The GitHubActionsTerraformRole is provisioned outside this Terraform configuration.
The AWS provider reads the demo bucket's settings even when they are not explicitly
configured. Attach the supplementary read-only policy before rerunning the workflow.
This does not replace the role's existing permissions for the state backend or
for creating and managing the bucket.

From the repository root, an AWS administrator in account 590507089733 can run:

aws iam put-role-policy \
  --role-name GitHubActionsTerraformRole \
  --policy-name Project18DemoBucketTerraformRead \
  --policy-document file://terraform/iam/github-actions-bucket-read-policy.json

The command replaces an existing inline policy with the same name, if present.
After attaching it, rerun the GitOps Infrastructure Deployment workflow. IAM
permissions boundaries, organization policies, or bucket policies must also permit
the listed actions. Changes to the policy file do not automatically update IAM.
