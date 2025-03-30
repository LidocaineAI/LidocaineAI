# Build
install:
	pip install -e .[dev,solana]

test:
	pytest tests/unit -v

test-all:
	pytest tests -v

lint:
	flake8 core/ tests/
	mypy core/

# Deployment
deploy-contracts:
	python scripts/deploy.py

run-api:
	uvicorn core.api:app --reload

# Clean
clean:
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete
	rm -rf .pytest_cache
