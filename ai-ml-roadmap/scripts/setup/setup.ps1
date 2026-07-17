# Setup Script
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AI/ML Roadmap Setup" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Create directories
Write-Host "Creating directories..." -ForegroundColor Yellow
New-Item -ItemType Directory -Path "datasets" -Force | Out-Null
New-Item -ItemType Directory -Path "models" -Force | Out-Null
New-Item -ItemType Directory -Path "experiments" -Force | Out-Null
New-Item -ItemType Directory -Path "logs" -Force | Out-Null

# Copy environment template
if (Test-Path ".env.example") {
    Write-Host "Creating .env from .env.example..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
}

# Set up pre-commit hooks
Write-Host "Setting up pre-commit hooks..." -ForegroundColor Yellow
uv run pre-commit install

Write-Host ""
Write-Host "✅ Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Activate environment: .venv\Scripts\Activate.ps1" -ForegroundColor White
Write-Host "  2. Install phase: ./scripts/install/install-phase0.ps1" -ForegroundColor White
Write-Host ""
