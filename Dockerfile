# Stage 1: Build stage
FROM python:3.10-slim AS build
WORKDIR /app

COPY src/ .
RUN pip install --no-cache-dir -r requirements.txt


# Stage 2: Runtime stage
FROM python:3.10-slim
WORKDIR /app

RUN groupadd -g 1000 appgroup && useradd -u 1000 -g appgroup appuser

COPY --from=build /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=build /app .

RUN chown -R appuser:appgroup /app
USER appuser

EXPOSE 80
CMD ["python", "app.py"]
