# Github-Actions-for-GCP

The provided GitHub Actions workflow is designed to deploy infrastructure using Terraform on Google Cloud Platform (GCP). Here's a breakdown of the workflow:

1. **Workflow Name and Triggers:**
   - The workflow is named "Deploy Infrastructure".
   - It is triggered by three events:
     - Manual trigger using the "workflow_dispatch" event.
     - Pull requests targeting the "main" branch.
     - Pushes to the "main" branch.

2. **Jobs:**
   - The workflow defines a single job named "deploy" that runs on an Ubuntu environment (`ubuntu-latest`).

3. **Steps:**
   - **Checkout Repository:** Clones the repository into the GitHub Actions environment.
   - **Authenticate to Google Cloud:** Authenticates to Google Cloud using the provided service account credentials and project ID.
   - **Set up Cloud SDK:** Sets up the Google Cloud SDK for interacting with GCP services.
   - **Initialize Terraform:** Initializes Terraform in the `./terraform` directory.
   - **Validate Terraform Files:** Validates the Terraform configuration files.
   - **Check Terraform Format:** Checks the formatting of Terraform files.
   - **Plan Terraform Changes:** Generates an execution plan for Terraform changes and saves it to `plans.tfplan`.
   - **Apply Terraform Changes:** Applies the Terraform execution plan to make infrastructure changes.

4. **Permissions:**
   - The job specifies permissions for interacting with repository contents (`contents: read`) and obtaining an identity token (`id-token: write`).

5. **Authentication and Setup:**
   - Google Cloud authentication is performed using the provided service account and project ID.
   - The Cloud SDK is set up to enable interaction with GCP resources.

6. **Terraform Workflow:**
   - Terraform commands such as `init`, `validate`, `fmt`, `plan`, and `apply` are executed sequentially within the `./terraform` directory.

This workflow automates the process of deploying infrastructure using Terraform on GCP. Make sure to replace placeholders such as `my-project`, `my-service-account@my-project.iam.gserviceaccount.com`, and adjust paths or configurations according to your project setup. Additionally, ensure that appropriate permissions are granted to the service account for managing GCP resources.



