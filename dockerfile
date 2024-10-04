FROM php:7.4-apache


COPY . /var/www/html/


RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

CMD ["apache2-foreground"]
