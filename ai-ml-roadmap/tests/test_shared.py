"""Shared module tests."""
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
