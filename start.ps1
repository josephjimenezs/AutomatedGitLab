param(
    [string]$RootPassword,
    [switch]$Down
)

$ErrorActionPreference = "Stop"

if ($Down) {
    podman compose down
    exit $LASTEXITCODE
}

if (-not $RootPassword) {
    $RootPassword = Read-Host "Password para el usuario root de GitLab (xotrik-gitlab)"
    if (-not $RootPassword) {
        Write-Error "No se definio un password. Abortando."
        exit 1
    }
}

Write-Host "Usando GITLAB_ROOT_PASSWORD = $RootPassword"

$env:GITLAB_ROOT_PASSWORD = $RootPassword
try {
    podman compose up -d
} finally {
    Remove-Item Env:\GITLAB_ROOT_PASSWORD -ErrorAction SilentlyContinue
}
