FROM php:8.2-apache

# Set non-interactive mode to prevent prompt freezes
ENV DEBIAN_FRONTEND=noninteractive

# Install mysqli extension
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Update package lists cleanly
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
