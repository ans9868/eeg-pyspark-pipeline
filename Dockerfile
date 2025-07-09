# Dockerfile for EEG PySpark pipeline
FROM bitnami/spark:3.5

WORKDIR /app

# Install Python dependencies
USER root
COPY ./requirements/requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy your pipeline code
COPY ./src/ ./src/
COPY ./run_pipeline.py .

# Switch back to Spark user (non-root)
USER 1001

# Default command (can be overridden)
CMD ["spark-submit", "--master", "local[*]", "/app/run_pipeline.py"]

