# Menggunakan image PHP versi 8.1 dengan Apache
FROM php:8.1-apache

# Instal ekstensi PHP yang dibutuhkan
RUN docker-php-ext-install pdo pdo_mysql pdo_sqlite

# Instal Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Menyalin file project ke folder /var/www/html/
COPY . /var/www/html/

# Setel permission untuk file dan folder
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Membuka port 80 agar aplikasi bisa diakses
EXPOSE 80

# Jalankan Apache di foreground
CMD ["apache2-foreground"]
