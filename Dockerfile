# Dockerfile for EEG PySpark pipeline
FROM bitnami/spark:3.5

WORKDIR /app

# Install Python dependencies
USER root
COPY ./requirements/requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy your pipeline code and entrypoint
COPY ./src/ ./src/
COPY entrypoint.sh /entrypoint.sh

# Make sure required Spark directories are writable
RUN mkdir -p /opt/bitnami/spark/tmp && \
    chmod -R 777 /opt/bitnami/spark/tmp && \
    chmod +x /entrypoint.sh

# Use non-root Spark user
USER 1001

# Set custom entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Default command can be overridden
CMD ["spark-submit", "--conf", "spark.jars.ivy=/tmp/.ivy2", "--master", "local[*]", "/app/src/digit_flatmap.py"]

