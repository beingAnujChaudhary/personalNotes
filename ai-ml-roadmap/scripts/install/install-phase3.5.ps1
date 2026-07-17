# Install Phase 3.5 Dependencies
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Installing Phase 3.5..." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check Python version
Write-Host "Checking Python version..." -ForegroundColor Yellow
python --version
if (1 -ne 0) {
    Write-Host "❌ Python not found. Please install Python 3.12+" -ForegroundColor Red
    exit 1
}

# Install dependencies
Write-Host ""
Write-Host "Installing dependencies..." -ForegroundColor Yellow
uv sync --extra dev --extra api --extra database

if (1 -ne 0) {
    Write-Host "❌ Installation failed!" -ForegroundColor Red
    exit 1
}

# Run tests
Write-Host ""
Write-Host "Running tests..." -ForegroundColor Yellow
uv run pytest tests/ -v --tb=short

Write-Host ""
Write-Host "✅ Phase 3.5 installation complete!" -ForegroundColor Green
Write-Host ""

