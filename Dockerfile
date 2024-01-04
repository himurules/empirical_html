FROM php:8.1-apache

# Install additional dependencies if needed
# RUN apt-get update && apt-get install -y <package-name>

# Copy your PHP application files to the container
COPY . /var/www/html/

# change owber ship to apache user
RUN chown -R www-data:www-data /var/www/html

# Enable mod_rewrite
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]