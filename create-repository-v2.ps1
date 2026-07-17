# ============================================
# AI/ML Roadmap Repository Creator v2.0
# Ultimate Hybrid Edition - 2026
# ============================================

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  AI/ML Roadmap Repository Creator v2.0" -ForegroundColor Cyan
Write-Host "  Ultimate Hybrid Edition 2026" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# ============================================
# Root Directory
# ============================================
$ROOT = "ai-ml-roadmap"
New-Item -ItemType Directory -Path $ROOT -Force | Out-Null
Set-Location $ROOT

Write-Host "📁 Creating repository structure..." -ForegroundColor Green

# ============================================
# GitHub Workflows
# ============================================
New-Item -ItemType Directory -Path ".github\workflows" -Force | Out-Null
New-Item -ItemType Directory -Path ".github\ISSUE_TEMPLATE" -Force | Out-Null

@"
name: Tests

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - name: Install uv
        run: pip install uv
      - name: Install dependencies
        run: uv sync --all-extras
      - name: Run tests
        run: uv run pytest tests/ -v --cov=src --cov-report=xml
"@ | Out-File -FilePath ".github\workflows\tests.yml" -Encoding utf8

@"
name: Lint

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - name: Install uv
        run: pip install uv
      - name: Install linting tools
        run: |
          uv pip install black ruff mypy isort
      - name: Run linters
        run: |
          uv run black --check .
          uv run ruff check .
          uv run mypy src/
          uv run isort --check .
"@ | Out-File -FilePath ".github\workflows\lint.yml" -Encoding utf8

@"
name: Security

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run security checks
        uses: github/codeql-action/analyze@v2
"@ | Out-File -FilePath ".github\workflows\security.yml" -Encoding utf8

@"
name: Pre-commit

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  pre-commit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.12'
      - uses: pre-commit/action@v3.0.0
"@ | Out-File -FilePath ".github\workflows\pre-commit.yml" -Encoding utf8

# Pull Request Template
@"
# Pull Request

## Description
<!-- Describe the changes in this PR -->

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Code refactor
- [ ] Performance improvement

## Testing
- [ ] Tests added/updated
- [ ] All tests pass

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
"@ | Out-File -FilePath ".github\PULL_REQUEST_TEMPLATE.md" -Encoding utf8

# ============================================
# Assets
# ============================================
New-Item -ItemType Directory -Path "assets\diagrams\mermaid" -Force | Out-Null
New-Item -ItemType Directory -Path "assets\diagrams\drawio" -Force | Out-Null
New-Item -ItemType Directory -Path "assets\diagrams\excalidraw" -Force | Out-Null
New-Item -ItemType Directory -Path "assets\images" -Force | Out-Null
New-Item -ItemType Directory -Path "assets\gifs" -Force | Out-Null

# ============================================
# Documentation
# ============================================
$docsDirs = @(
    "docs\books",
    "docs\blogs",
    "docs\papers",
    "docs\cheatsheets",
    "docs\system-design",
    "docs\interview",
    "docs\references",
    "docs\roadmaps"
)
foreach ($dir in $docsDirs) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

# ============================================
# Templates
# ============================================
New-Item -ItemType Directory -Path "templates\project-template" -Force | Out-Null
New-Item -ItemType Directory -Path "templates\readme-template" -Force | Out-Null
New-Item -ItemType Directory -Path "templates\architecture-template" -Force | Out-Null
New-Item -ItemType Directory -Path "templates\docker-template" -Force | Out-Null

# ============================================
# Scripts
# ============================================
$scriptsDirs = @(
    "scripts\setup",
    "scripts\install",
    "scripts\data",
    "scripts\deployment",
    "scripts\benchmark",
    "scripts\utilities"
)
foreach ($dir in $scriptsDirs) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

# ============================================
# Source Code - Production Ready Structure
# ============================================
$srcDirs = @(
    "src\common",
    "src\config",
    "src\data",
    "src\features",
    "src\models",
    "src\training",
    "src\evaluation",
    "src\deployment",
    "src\llm",
    "src\rag",
    "src\agents",
    "src\monitoring",
    "src\visualization"
)
foreach ($dir in $srcDirs) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

# Create __init__.py files
Get-ChildItem -Path "src" -Directory -Recurse | ForEach-Object {
    $initPath = Join-Path $_.FullName "__init__.py"
    if (-not (Test-Path $initPath)) {
        @"
\"\"\"$($_.Name) module.\"\"\"
"@ | Out-File -FilePath $initPath -Encoding utf8
    }
}

# ============================================
# Phase Folders
# ============================================
$phases = @(
    "phase-00-foundations",
    "phase-01-machine-learning",
    "phase-02-deep-learning",
    "phase-03-nlp-transformers",
    "phase-035-production-systems",
    "phase-04-data-engineering",
    "phase-05-mlops-production",
    "phase-06-llms-rag-agents",
    "phase-07-advanced-ai-engineering",
    "phase-08-capstone"
)

foreach ($phase in $phases) {
    New-Item -ItemType Directory -Path "$phase\projects" -Force | Out-Null
    New-Item -ItemType Directory -Path "$phase\notebooks" -Force | Out-Null
    New-Item -ItemType Directory -Path "$phase\src" -Force | Out-Null
    New-Item -ItemType Directory -Path "$phase\tests" -Force | Out-Null
    New-Item -ItemType Directory -Path "$phase\configs" -Force | Out-Null
    New-Item -ItemType Directory -Path "$phase\docs" -Force | Out-Null
    New-Item -ItemType Directory -Path "$phase\assets" -Force | Out-Null
    
    @"
# $phase

## Overview
<!-- Add phase overview here -->

## Projects
<!-- List projects -->

## Resources
<!-- Add resources -->
"@ | Out-File -FilePath "$phase\README.md" -Encoding utf8
}

# ============================================
# Projects Folder - Each project gets its own space
# ============================================
New-Item -ItemType Directory -Path "projects" -Force | Out-Null

# Create template project structure
$templateProject = "projects\_template"
New-Item -ItemType Directory -Path "$templateProject\src" -Force | Out-Null
New-Item -ItemType Directory -Path "$templateProject\tests" -Force | Out-Null
New-Item -ItemType Directory -Path "$templateProject\notebooks" -Force | Out-Null
New-Item -ItemType Directory -Path "$templateProject\configs" -Force | Out-Null
New-Item -ItemType Directory -Path "$templateProject\data" -Force | Out-Null
New-Item -ItemType Directory -Path "$templateProject\models" -Force | Out-Null

@"
# Project Name

## Overview
<!-- Brief description -->

## Problem Statement
<!-- What problem does this solve? -->

## Solution
<!-- How does it solve it? -->

## Architecture
<!-- Diagram and explanation -->

## Setup
\`\`\`bash
# Installation steps
\`\`\`

## Usage
\`\`\`python
# Example code
\`\`\`

## Results
<!-- Metrics and performance -->

## License
MIT
"@ | Out-File -FilePath "$templateProject\README.md" -Encoding utf8

# ============================================
# Configs
# ============================================
New-Item -ItemType Directory -Path "configs" -Force | Out-Null

@"
# Logging Configuration
version: 1
disable_existing_loggers: false
formatters:
  standard:
    format: "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
handlers:
  console:
    class: logging.StreamHandler
    level: INFO
    formatter: standard
    stream: ext://sys.stdout
root:
  level: INFO
  handlers: [console]
"@ | Out-File -FilePath "configs\logging.yaml" -Encoding utf8

@"
# Paths Configuration
paths:
  data: "datasets/"
  models: "models/"
  experiments: "experiments/"
  logs: "logs/"
"@ | Out-File -FilePath "configs\paths.yaml" -Encoding utf8

@"
# Settings
settings:
  random_seed: 42
  default_device: "cuda"
  debug: false
"@ | Out-File -FilePath "configs\settings.yaml" -Encoding utf8

# ============================================
# Examples
# ============================================
$examplesDirs = @(
    "examples\pandas",
    "examples\numpy",
    "examples\sklearn",
    "examples\pytorch",
    "examples\fastapi",
    "examples\docker"
)
foreach ($dir in $examplesDirs) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

# ============================================
# Experiments
# ============================================
New-Item -ItemType Directory -Path "experiments" -Force | Out-Null

# ============================================
# Tests
# ============================================
New-Item -ItemType Directory -Path "tests" -Force | Out-Null

@"
\"\"\"Shared module tests.\"\"\"
import pytest
from src.common import config, data, metrics

def test_config():
    assert config.get_project_root().exists()

def test_data():
    # Test data loading functions
    pass

def test_metrics():
    # Test metric functions
    pass
"@ | Out-File -FilePath "tests\test_shared.py" -Encoding utf8

# ============================================
# Install Scripts
# ============================================

# Helper function for install scripts
function Create-InstallScript {
    param($Name, $Extras)
    @"
# Install Phase $Name Dependencies
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Installing Phase $Name..." -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check Python version
Write-Host "Checking Python version..." -ForegroundColor Yellow
python --version
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Python not found. Please install Python 3.12+" -ForegroundColor Red
    exit 1
}

# Install dependencies
Write-Host ""
Write-Host "Installing dependencies..." -ForegroundColor Yellow
uv sync $Extras

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Installation failed!" -ForegroundColor Red
    exit 1
}

# Run tests
Write-Host ""
Write-Host "Running tests..." -ForegroundColor Yellow
uv run pytest tests/ -v --tb=short

Write-Host ""
Write-Host "✅ Phase $Name installation complete!" -ForegroundColor Green
Write-Host ""
"@ | Out-File -FilePath "scripts\install\install-phase$Name.ps1" -Encoding utf8
}

# Create individual install scripts
Create-InstallScript "0" "--extra dev"
Create-InstallScript "1" "--extra dev --extra ml"
Create-InstallScript "2" "--extra dev --extra deep-learning --extra vision"
Create-InstallScript "3" "--extra dev --extra nlp"
Create-InstallScript "3.5" "--extra dev --extra api --extra database"
Create-InstallScript "4" "--extra dev --extra api --extra database --extra data-engineering"
Create-InstallScript "5" "--extra dev --extra mlops"
Create-InstallScript "6" "--extra dev --extra llm --extra vectordb"
Create-InstallScript "7" "--extra dev --extra deployment"
Create-InstallScript "8" "--extra dev --extra ml --extra deep-learning --extra vision --extra nlp --extra llm --extra vectordb --extra api --extra database --extra data-engineering --extra mlops --extra deployment"

# Install All Script
@"
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
"@ | Out-File -FilePath "scripts\install\install-all.ps1" -Encoding utf8

# ============================================
# Setup Script
# ============================================
@"
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
"@ | Out-File -FilePath "scripts\setup\setup.ps1" -Encoding utf8

# ============================================
# Root Files
# ============================================

# .gitignore - Improved version
@"
# ============================================
# Python
# ============================================
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
ENV/
env.bak/
venv.bak/

# ============================================
# Jupyter Notebooks
# ============================================
.ipynb_checkpoints/
*-checkpoint.ipynb

# Keep notebooks under version control
# *.ipynb is NOT ignored globally

# ============================================
# Data & Models
# ============================================
*.pkl
*.joblib
*.h5
*.hdf5
*.pt
*.pth
*.onnx
*.tflite

# Ignore large datasets but allow sample_data
datasets/
!datasets/sample_data/
data/
!data/sample_data/

models/
experiments/

# ============================================
# Environment & Secrets
# ============================================
.env
.env.local
*.key
*.pem
*.crt
secrets.yaml
credentials.json
service-account.json

# ============================================
# Docker
# ============================================
docker-compose.override.yml
.dockerignore
*.dockerignore

# ============================================
# IDE
# ============================================
.vscode/
.idea/
*.swp
*.swo
*~
.DS_Store

# ============================================
# MLOps
# ============================================
mlruns/
mlflow.db
wandb/

# ============================================
# Logs
# ============================================
logs/
*.log

# ============================================
# Terraform
# ============================================
*.tfstate
*.tfstate.*
.terraform/

# ============================================
# OS
# ============================================
Thumbs.db
Desktop.ini

# ============================================
# Temporary
# ============================================
tmp/
temp/
*.tmp
*.bak

# ============================================
# Build & Distribution
# ============================================
build/
dist/
*.egg-info/
.pytest_cache/
.coverage
htmlcov/
.mypy_cache/
.ruff_cache/
"@ | Out-File -FilePath ".gitignore" -Encoding utf8

# .python-version
@"
3.12
"@ | Out-File -FilePath ".python-version" -Encoding utf8

# pyproject.toml
@"
[project]
name = "ai-ml-roadmap"
version = "0.1.0"
description = "Ultimate Hybrid AI & ML Roadmap"
readme = "README.md"
requires-python = ">=3.12,<3.14"

dependencies = [
    "numpy",
    "pandas",
    "scipy",
    "polars",
    "pyarrow",
    "matplotlib",
    "plotly",
    "jupyterlab",
    "ipykernel",
    "rich",
    "tqdm",
    "python-dotenv",
    "pydantic",
]

[project.optional-dependencies]

ml = [
    "scikit-learn",
    "xgboost",
    "lightgbm",
    "catboost",
    "optuna",
    "imbalanced-learn",
    "shap",
]

deep-learning = [
    "torch",
    "torchvision",
    "torchaudio",
]

vision = [
    "opencv-python",
    "albumentations",
    "timm",
    "ultralytics",
]

nlp = [
    "transformers",
    "datasets",
    "accelerate",
    "evaluate",
    "sentence-transformers",
]

llm = [
    "langchain",
    "langchain-community",
    "langchain-openai",
    "langgraph",
    "llama-index",
    "peft",
    "trl",
    "tiktoken",
]

vectordb = [
    "chromadb",
    "faiss-cpu",
    "qdrant-client",
]

api = [
    "fastapi",
    "uvicorn",
    "httpx",
    "python-multipart",
]

database = [
    "sqlalchemy",
    "psycopg[binary]",
    "alembic",
]

data-engineering = [
    "duckdb",
    "redis",
    "celery",
]

mlops = [
    "mlflow",
    "wandb",
    "evidently",
    "dvc",
]

deployment = [
    "streamlit",
    "gradio",
]

docs = [
    "mkdocs",
    "mkdocs-material",
]

dev = [
    "pytest",
    "pytest-cov",
    "black",
    "ruff",
    "mypy",
    "isort",
    "pre-commit",
]

[project.urls]
Homepage = "https://github.com/yourusername/ai-ml-roadmap"
Documentation = "https://github.com/yourusername/ai-ml-roadmap/blob/main/README.md"
Repository = "https://github.com/yourusername/ai-ml-roadmap"

[tool.black]
line-length = 88
target-version = ['py312']

[tool.ruff]
line-length = 88
target-version = "py312"

[tool.isort]
profile = "black"
line_length = 88

[tool.pytest.ini_options]
testpaths = ["tests"]
addopts = "-v --tb=short --strict-markers"
python_files = "test_*.py"

[tool.mypy]
python_version = "3.12"
ignore_missing_imports = true
warn_return_any = true
warn_unused_configs = true

[tool.pre-commit]
repos = [
    { repo = "https://github.com/pre-commit/pre-commit-hooks", rev = "v4.4.0", hooks = [{ id = "trailing-whitespace" }, { id = "end-of-file-fixer" }, { id = "check-yaml" }, { id = "check-added-large-files" }] },
    { repo = "https://github.com/psf/black", rev = "23.11.0", hooks = [{ id = "black" }] },
    { repo = "https://github.com/astral-sh/ruff-pre-commit", rev = "v0.1.8", hooks = [{ id = "ruff", args = ["--fix"] }] },
    { repo = "https://github.com/PyCQA/isort", rev = "5.12.0", hooks = [{ id = "isort" }] },
    { repo = "https://github.com/pre-commit/mirrors-mypy", rev = "v1.7.0", hooks = [{ id = "mypy" }] },
]
"@ | Out-File -FilePath "pyproject.toml" -Encoding utf8

# .pre-commit-config.yaml
@"
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-added-large-files

  - repo: https://github.com/psf/black
    rev: 23.11.0
    hooks:
      - id: black

  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.8
    hooks:
      - id: ruff
        args: ["--fix"]

  - repo: https://github.com/PyCQA/isort
    rev: 5.12.0
    hooks:
      - id: isort
"@ | Out-File -FilePath ".pre-commit-config.yaml" -Encoding utf8

# .env.example
@"
# Environment Variables
# Copy this file to .env and fill in your values

# API Keys
OPENAI_API_KEY=your_key_here
HUGGINGFACE_TOKEN=your_token_here
ANTHROPIC_API_KEY=your_key_here

# Database
DATABASE_URL=postgresql://user:pass@localhost:5432/db
DATABASE_URL_TEST=postgresql://user:pass@localhost:5432/db_test

# Redis
REDIS_URL=redis://localhost:6379
REDIS_URL_TEST=redis://localhost:6380

# MLflow
MLFLOW_TRACKING_URI=http://localhost:5000

# Weights & Biases
WANDB_API_KEY=your_key_here
WANDB_PROJECT=ai-ml-roadmap

# AWS
AWS_ACCESS_KEY_ID=your_key_here
AWS_SECRET_ACCESS_KEY=your_secret_here
AWS_REGION=us-east-1
AWS_S3_BUCKET=your_bucket_here
"@ | Out-File -FilePath ".env.example" -Encoding utf8

# ============================================
# README.md - Placeholder (you'll fill this)
# ============================================
@"
# 🚀 Ultimate Hybrid AI & ML Master Roadmap (2026 Edition)

> **The Production-Ready AI & ML Roadmap for 2026 — From Researcher to Product Engineer**

## 📌 Overview

This repository is your comprehensive guide to becoming a **Production-Ready AI Engineer** in 2026.

## 📂 Repository Structure

See the full structure in the repository.

## 🚀 Quick Start

\`\`\`bash
# Clone the repository
git clone https://github.com/yourusername/ai-ml-roadmap.git
cd ai-ml-roadmap

# Create virtual environment
uv venv --python 3.12
.venv\Scripts\Activate.ps1

# Setup
./scripts/setup/setup.ps1

# Install Phase 0
./scripts/install/install-phase0.ps1
\`\`\`

## 📊 Roadmap Phases

| Phase | Focus | Duration |
|-------|-------|----------|
| Phase 0 | Foundations | 3-4 weeks |
| Phase 1 | ML | 4-6 weeks |
| Phase 2 | Deep Learning | 6-8 weeks |
| Phase 3 | NLP | 4-6 weeks |
| Phase 3.5 | Production Systems | 2-3 weeks |
| Phase 4 | Data Engineering | 4-6 weeks |
| Phase 5 | MLOps | 4-6 weeks |
| Phase 6 | LLMs, RAG, Agents | 8-10 weeks |
| Phase 7 | Advanced AI | 6-8 weeks |
| Phase 8 | Capstone | 4-6 weeks |

## 📝 Project Evaluation Checklist

Before marking any project as "complete":
- [ ] **Latency:** P95 < 150ms
- [ ] **Throughput:** 50 req/sec
- [ ] **Memory:** Optimized
- [ ] **Scalability:** Horizontal
- [ ] **Observability:** Logs, metrics, traces
- [ ] **Security:** No hardcoded keys

## 📚 Resources

- [Learning Log](LEARNING_LOG.md)
- [Project Tracker](PROJECT_TRACKER.md)
- [Resources](RESOURCES.md)

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](.github/CONTRIBUTING.md).

## 📄 License

MIT

---

*Built for the 2026 AI Engineer. Focus on production, measure your impact, and ship relentlessly.* 🚀
"@ | Out-File -FilePath "README.md" -Encoding utf8

# ============================================
# Additional Documentation Files
# ============================================

# LICENSE
@"
MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"@ | Out-File -FilePath "LICENSE" -Encoding utf8

# LEARNING_LOG.md
@"
# 📚 Learning Log

## Daily Learning Log

| Date | Topic | Resources Used | Key Learnings | Next Steps |
|------|-------|----------------|---------------|------------|
| 2026-01-01 | - | - | - | - |

## Weekly Summary

### Week 1 (2026-01-01 to 2026-01-07)

**Focus:** TBD

**What I Learned:**
- TBD

**Projects Completed:**
- [ ] TBD

**Next Week's Focus:**
- TBD

## Milestones

- [ ] Complete Phase 0
- [ ] Complete Phase 1
- [ ] Complete Phase 2
- [ ] Complete Phase 3
- [ ] Complete Phase 3.5
- [ ] Complete Phase 4
- [ ] Complete Phase 5
- [ ] Complete Phase 6
- [ ] Complete Phase 7
- [ ] Complete Phase 8
"@ | Out-File -FilePath "LEARNING_LOG.md" -Encoding utf8

# PROJECT_TRACKER.md
@"
# 📊 Project Tracker

## Legend

| Symbol | Meaning |
|--------|---------|
| ⬜ | Not Started |
| 🟡 | In Progress |
| ✅ | Complete |
| 🚀 | Deployed |
| 📝 | Documented |

## Phase 0: Foundations

| Project | Status | Repository | Live Demo | Metrics |
|---------|--------|------------|-----------|---------|
| 0.1: Automated Scraper | ⬜ | - | - | - |
| 0.2: SQL Analytics | ⬜ | - | - | - |
| 0.3: Data API | ⬜ | - | - | - |

## Phase 1: ML

| Project | Status | Repository | Live Demo | Metrics |
|---------|--------|------------|-----------|---------|
| 1.1: End-to-End ML Pipeline | ⬜ | - | - | - |
| 1.2: Fraud Detection | ⬜ | - | - | - |
| 1.3: Customer Segmentation | ⬜ | - | - | - |
| 1.4: ML Monitoring | ⬜ | - | - | - |

*[Continue for all phases...]*
"@ | Out-File -FilePath "PROJECT_TRACKER.md" -Encoding utf8

# RESOURCES.md
@"
# 📚 Resources Master List

## 🐍 Python
- Python for Everybody: [Coursera](https://www.coursera.org/specializations/python)
- Real Python: [Link](https://realpython.com/)

## 📊 Data Analysis
- Kaggle Python Course: [Link](https://www.kaggle.com/learn/python)
- Mode SQL Tutorial: [Link](https://mode.com/sql-tutorial/)

## 📐 Mathematics
- 3Blue1Brown: [YouTube](https://www.youtube.com/@3blue1brown)
- StatQuest: [YouTube](https://www.youtube.com/@StatQuest)

## 🤖 Machine Learning
- Andrew Ng ML Specialization: [Link](https://www.deeplearning.ai/courses/machine-learning-specialization/)
- Hands-On ML: O'Reilly

## 🧠 Deep Learning
- PyTorch for Deep Learning: [Link](https://www.learnpytorch.io/)
- Dive into Deep Learning: [Link](https://d2l.ai/)

## 🔬 NLP
- Hugging Face NLP Course: [Link](https://huggingface.co/learn/nlp-course)
- Karpathy Zero to Hero: [Link](https://karpathy.ai/zero-to-hero.html)

## 🤖 Generative AI
- GenAI with LLMs: [Link](https://www.deeplearning.ai/courses/generative-ai-with-llms/)
- LangGraph Docs: [Link](https://langchain-ai.github.io/langgraph/)
- MCP Docs: [Link](https://modelcontextprotocol.io/)
"@ | Out-File -FilePath "RESOURCES.md" -Encoding utf8

# ============================================
# Summary
# ============================================

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  ✅ Repository Created Successfully!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📂 Location: $(Get-Location)" -ForegroundColor Yellow
Write-Host ""
Write-Host "📋 Key Improvements in v2.0:" -ForegroundColor Cyan
Write-Host "  ✅ Better .gitignore (keeps notebooks & sample data)" -ForegroundColor White
Write-Host "  ✅ projects/ folder for dedicated project spaces" -ForegroundColor White
Write-Host "  ✅ Reorganized src/ (production-ready structure)" -ForegroundColor White
Write-Host "  ✅ experiments/ for research notebooks" -ForegroundColor White
Write-Host "  ✅ examples/ for runnable code snippets" -ForegroundColor White
Write-Host "  ✅ configs/ for centralized configuration" -ForegroundColor White
Write-Host "  ✅ Improved GitHub Actions (security, pre-commit)" -ForegroundColor White
Write-Host "  ✅ Smarter install scripts with error handling" -ForegroundColor White
Write-Host ""
Write-Host "🚀 Next Steps:" -ForegroundColor Cyan
Write-Host "  1. cd ai-ml-roadmap" -ForegroundColor White
Write-Host "  2. uv venv --python 3.12" -ForegroundColor White
Write-Host "  3. .venv\Scripts\Activate.ps1" -ForegroundColor White
Write-Host "  4. uv sync --no-install-project" -ForegroundColor White
Write-Host "  5. ./scripts/setup/setup.ps1" -ForegroundColor White
Write-Host "  6. ./scripts/install/install-phase0.ps1" -ForegroundColor White
Write-Host ""
Write-Host "🎯 Stop tweaking, start building!" -ForegroundColor Magenta
Write-Host "   Focus on adding content - notes, projects, and code." -ForegroundColor Magenta
Write-Host ""