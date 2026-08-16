# AutomatedGitLab
this is the project to setup the required for minimal configuration github community edition for learning purposes.

Credentials:
user: root
password: set manually each run, see below

setup start:  .\start.ps1
setup end:    .\start.ps1 -Down

`start.ps1` prompts for the GitLab root password on every run (or accepts it via
`-RootPassword`) and passes it to `podman compose up -d` as a process-only
environment variable. It is never written to `.env` or committed to git.
Copy `.env.example` to `.env` and fill in the non-secret values before first run.
