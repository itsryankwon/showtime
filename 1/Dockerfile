FROM php:7.3.0-apache

# Copy php files to root folder of web server
COPY php/ /var/www/html/

# Create directories for system temp files
RUN mkdir /tmp/php
RUN mkdir /tmp/php/showtime

# move configured-for-showtime php.ini
RUN mv /var/www/html/php.ini $PHP_INI_DIR

# Create error log file to be written to
RUN touch $PHP_INI_DIR/php_showtime_error.log