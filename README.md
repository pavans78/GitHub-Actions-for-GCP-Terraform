# Github-Actions-for-GCP

This repo about the  GitHub Actions workflow is tailored for deploying infrastructure via Terraform on Google Cloud Platform (GCP). It can be triggered manually or automatically when you push code.  Think of it like a magic button for deploying your infrastructure!

## GitHub Actions Workflow
The Github Actions workflow defines a named "Deploy Infrastructure" for a GitHub Actions CICD pipeline. Here's a breakdown of its workflow:

**Workflow Name:**

- `name: Deploy Infrastructure` - This assigns a name to the workflow, which will be displayed in the "Actions" tab of your repository on GitHub.

**Triggers:**

- `on:` This section defines the events that can trigger the workflow. This workflow can be triggered in three ways:

    - **Manually:**  `workflow_dispatch:` allows manual triggering of the workflow from the GitHub UI. It defines inputs for the environment (production, qa, or dev) to be deployed to.

    - **Pull Request on Main Branch:** `pull_request: branches: [ "main" ]` specifies that the workflow runs automatically when a pull request is opened or updated targeting the "main" branch.

    - **Push to Main Branch:** `push: branches: - 'main'` configures the workflow to run automatically whenever code is pushed directly to the "main" branch.

**Jobs:**

- `jobs:` This section defines the jobs that will be executed within the workflow. Here, only one job is defined named `deploy`.

**Job Details:**

- `deploy:` This section defines the details of the `deploy` job.
    - `permissions:` This specifies the permissions required by the job. Here, it needs read access to repository contents and write access to id tokens.
    - `name: Deploy Infra` - This assigns a name to the job displayed in the Actions UI.
    - `runs-on: ubuntu-latest` - This defines that the job will run on an Ubuntu virtual machine with the latest version.

**Job Steps:**

- `steps:` This section defines the individual steps that will be executed sequentially within the `deploy` job. Here, these steps handle infrastructure deployment using Terraform:
    1. **Pull Code:** `uses: actions/checkout@v2` - This step retrieves the code from your repository into the virtual machine's workspace.

    2. **Authenticate to Google Cloud:** `uses: google-github-actions/auth@v2` - This step authenticates with Google Cloud using the provided project ID, workload identity provider, and service account details.

    3. **Set up Cloud SDK:** `uses: google-github-actions/setup-gcloud@v2` - This step sets up the Google Cloud SDK for interacting with Google Cloud services.

    4. **Initialize Terraform:** This step initializes the Terraform environment within the `./terraform` directory.

    5. **Validate Terraform Files:** This step validates the Terraform configuration files for syntax errors.

    6. **Check Terraform Format:** This step checks the formatting of Terraform files for consistency.

    7. **Plan Terraform Changes:** This step creates a plan for the infrastructure changes defined in the Terraform files. The plan is stored in `plans.tfplan`.

    8. **Apply Terraform Changes:** This step applies the planned infrastructure changes defined in `plans.tfplan` to your Google Cloud environment.

This workflow effectively demonstrates how to use GitHub Actions to automate infrastructure deployment using Terraform triggered by various events. Note that you'll need to replace placeholders like `my-project`, `123456789`, and service account details with your own values. 

For in-depth instructions and details, refer to the official documentation on [GitHub Actions Workflow](https://docs.github.com/en/actions/using-workflows/about-workflows)
