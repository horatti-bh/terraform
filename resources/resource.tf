resource "github_repository" "example" {
  name        = "robo"
  description = "My awesome codebase"
  auto_init   = true
}

provider "github" {
  version = "2.5"
}