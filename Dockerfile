# Dockerfile for EEG PySpark pipeline
FROM bitnami/spark:3.5

WORKDIR /app

# Install Python dependencies
USER root
COPY ./requirements/requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy your pipeline code
COPY ./src/ ./src/
COPY ./start-pipeline.py .

# make sure that the bitnami parts are writable for pyspark 
RUN mkdir -p /opt/bitnami/spark/tmp && \
    chmod -R 777 /opt/bitnami/spark/tmp

# Switch back to Spark user (non-root)
USER 1001

# blank entrypoint to overwrite (and let CMD) the default entrypoint of 
# ENTRYPOINT ["/app/entrypoint.sh"] #we can also do this in the future for more control
ENTRYPOINT [] 
# Default command (can be overridden)
CMD ["spark-submit", "--master", "local[*]", "/app/run_pipeline.py"]

