# Install Phase 8 Dependencies
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Installing Phase 8..." -ForegroundColor Green
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
uv sync --extra dev --extra ml --extra deep-learning --extra vision --extra nlp --extra llm --extra vectordb --extra api --extra database --extra data-engineering --extra mlops --extra deployment

if (1 -ne 0) {
    Write-Host "❌ Installation failed!" -ForegroundColor Red
    exit 1
}

# Run tests
Write-Host ""
Write-Host "Running tests..." -ForegroundColor Yellow
uv run pytest tests/ -v --tb=short

Write-Host ""
Write-Host "✅ Phase 8 installation complete!" -ForegroundColor Green
Write-Host ""

