# Gunakan image PHP resmi
FROM php:8.2-apache

# Salin semua file aplikasi Anda ke direktori kerja
COPY . /var/www/html/

# Pastikan izin file benar
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose port 80 untuk Cloud Run
EXPOSE 80

# Jalankan server
CMD ["apache2-foreground"]
