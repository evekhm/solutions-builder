locals {
  # Add users here.
  user_accounts = [
    "user:jonchen@google.com",
  ]

  sa_accounts = [
    # Example:
    # "serviceAccount:service-account@sample-project-id.iam.gserviceaccount.com",
  ]
}

resource "google_project_iam_member" "add_sa_accounts" {
  for_each = toset(local.sa_accounts)
  project  = local.project
  role     = "roles/viewer"
  member   = each.value
}

resource "google_project_iam_binding" "add_user_accounts" {
  project  = local.project
  role     = "roles/editor"
  members  = local.user_accounts
}
