# Menggunakan image PHP versi 7.4 dengan Apache sebagai server web
FROM php:7.4-apache

# Instal ekstensi pdo_mysql yang dibutuhkan untuk koneksi database MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Menyalin file project ke folder /var/www/html/ di dalam container
COPY . /var/www/html/
 
# Setel permission agar file dapat diakses oleh server Apache di dalam container
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Membuka port 80 agar aplikasi bisa diakses melalui localhost
ENV PORT 80
EXPOSE 80


# Jalankan Apache di foreground agar container tetap berjalan
CMD ["apache2-foreground"]
