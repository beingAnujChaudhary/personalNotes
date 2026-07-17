# Install All Dependencies
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Installing ALL Dependencies..." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Checking Python version..." -ForegroundColor Yellow
python --version

Write-Host ""
Write-Host "Installing all dependencies..." -ForegroundColor Yellow
uv sync --extra dev --extra ml --extra deep-learning --extra vision --extra nlp --extra llm --extra vectordb --extra api --extra database --extra data-engineering --extra mlops --extra deployment

Write-Host ""
Write-Host "Running tests..." -ForegroundColor Yellow
uv run pytest tests/ -v --tb=short

Write-Host ""
Write-Host "✅ All dependencies installed!" -ForegroundColor Green
Write-Host ""

