FROM php

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

VOLUME . ./backend

WORKDIR /backend

COPY .env.example /backend/.env

RUN composer install

RUN php artisan config:cache

RUN php artisan key:generate

RUN php artisan serve --host 0.0.0.0
