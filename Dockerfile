# Use an official PHP image with Apache
FROM php:8.1-apache

# Enable the Apache mod_rewrite (if needed for routing)
RUN a2enmod rewrite

# Set the working directory to the Apache web root
WORKDIR /var/www/html

# Copy the custom index.php file into the web root
COPY ./phpapp /var/www/html/

# Expose port 8000
EXPOSE 8002

# Update Apache config to listen on port 8000
RUN echo "Listen 8002" >> /etc/apache2/ports.conf && \
    sed -i 's/80/8002/' /etc/apache2/sites-available/000-default.conf

# Start Apache in the foreground
CMD ["apache2-foreground"]
