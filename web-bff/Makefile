# Create and activate virtual environment + install dependencies
setup:
	python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt

# Run FastAPI app
run:
	source venv/bin/activate && uvicorn main:app --reload

# Deactivate virtual environment
deactivate:
	deactivate

# Clean up environment (removes venv)
clean:
	rm -rf venv __pycache__
