#!/bin/bash

# Activate the virtual environment
source /venv/bin/activate

# Start the Jupyter notebook server
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=SPRDSRAY