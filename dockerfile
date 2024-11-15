# Menggunakan image PHP versi 7.4 dengan Apache sebagai server web
FROM php:7.4-apache

# Instal ekstensi pdo_mysql yang dibutuhkan untuk koneksi database MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Menyalin file project ke folder /var/www/html/ di dalam container
COPY . /var/www/html/
 
# Setel permission agar file dapat diakses oleh server Apache di dalam container
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Membuka port 8080 agar sesuai dengan Cloud Run
EXPOSE 8080

# Konfigurasi Apache agar mendengarkan port 8080
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/*.conf

# Jalankan Apache di foreground agar container tetap berjalan
CMD ["apache2-foreground"]
