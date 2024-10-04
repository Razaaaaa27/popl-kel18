# Menggunakan image PHP versi 7.4 dengan Apache sebagai server web
FROM php:7.4-apache

# Copy semua file dari folder project ke folder /var/www/html/ di dalam container
COPY . /var/www/html/

# Setel permission agar file dapat diakses oleh server Apache di dalam container
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Jalankan Apache di foreground, sehingga container tetap berjalan
CMD ["apache2-foreground"]
