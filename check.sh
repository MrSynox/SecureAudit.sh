#!/bin/bash

# Rapor dosyasının oluşturulması
REPORT_FILE="security_audit_report.txt"
echo "Güvenlik Denetim Raporu" > $REPORT_FILE
echo "========================" >> $REPORT_FILE
echo "Tarih: $(date)" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 1. Sistem Bilgileri
echo "1. Sistem Bilgileri" >> $REPORT_FILE
echo "Hostname: $(hostname)" >> $REPORT_FILE
echo "Kernel Versiyonu: $(uname -r)" >> $REPORT_FILE
echo "Sistem Mimarisi: $(uname -m)" >> $REPORT_FILE
echo "Distribütör: $(lsb_release -d | cut -f2-)" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 2. Kullanıcı ve Grub Bilgileri
echo "2. Kullanıcı ve Grub Bilgileri" >> $REPORT_FILE
echo "Toplam Kullanıcı Sayısı: $(cat /etc/passwd | wc -l)" >> $REPORT_FILE
echo "Sistemdeki Kullanıcılar:" >> $REPORT_FILE
cut -d: -f1 /etc/passwd >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 3. SUID ve SGID Bitleri
echo "3. SUID ve SGID Bitleri" >> $REPORT_FILE
echo "SUID Bitli Dosyalar:" >> $REPORT_FILE
find / -perm -4000 -type f 2>/dev/null >> $REPORT_FILE
echo "SGID Bitli Dosyalar:" >> $REPORT_FILE
find / -perm -2000 -type f 2>/dev/null >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 4. Açık Portlar ve Servisler
echo "4. Açık Portlar ve Servisler" >> $REPORT_FILE
echo "Açık Portlar:" >> $REPORT_FILE
ss -tuln >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 5. SSH Ayarları
echo "5. SSH Ayarları" >> $REPORT_FILE
echo "SSH Yapılandırması:" >> $REPORT_FILE
cat /etc/ssh/sshd_config >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 6. Log Dosyaları Kontrolü
echo "6. Log Dosyaları Kontrolü" >> $REPORT_FILE
echo "Son 10 SSH Giriş Denemesi:" >> $REPORT_FILE
last -n 10 | grep 'ssh' >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 7. Dosya İzinleri
echo "7. Kritik Dosyaların İzinleri" >> $REPORT_FILE
echo "Kritik Dosyaların İzinleri:" >> $REPORT_FILE
ls -l /etc/passwd /etc/shadow /etc/group >> $REPORT_FILE
echo "" >> $REPORT_FILE

# 8. Kullanıcı Bazlı Cron Görevleri
echo "8. Kullanıcı Bazlı Cron Görevleri" >> $REPORT_FILE
for user in $(cut -f1 -d: /etc/passwd); do
    echo "Kullanıcı: $user" >> $REPORT_FILE
    crontab -l -u $user 2>/dev/null >> $REPORT_FILE
done
echo "" >> $REPORT_FILE

# Raporu bitir
echo "Güvenlik Denetim Raporu başarıyla oluşturuldu: $REPORT_FILE"
