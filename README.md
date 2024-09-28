# SecureAudit.sh
SecureAudit: Sistem Güvenliği Denetim Aracı
SecureAudit, sistem yöneticileri ve güvenlik uzmanları için geliştirilmiş bir bash scriptidir. Bu araç, sistem güvenliğini değerlendirmek için yerleşik komutları kullanarak kapsamlı bir denetim yapar. Script, aşağıdaki temel alanları analiz eder:

Sistem Bilgileri: Sunucu adı, işletim sistemi ve çekirdek versiyonu gibi temel bilgileri toplar.

Kullanıcı ve Grub Bilgileri: Sistemdeki kullanıcıların sayısını ve isimlerini listeler.

SUID ve SGID Kontrolleri: SUID ve SGID bitine sahip dosyaları belirler.

Açık Portlar ve Servisler: Aktif olan portları ve bu portlar üzerinden çalışan servisleri gösterir.

SSH Ayarları: SSH yapılandırma dosyasını kontrol eder.

Log Dosyaları: Son SSH giriş denemelerini inceleyerek güvenlik açıklarını tespit etmeye yardımcı olur.

Kritik Dosya İzinleri: Kritik sistem dosyalarının izinlerini kontrol eder.

Kullanıcı Bazlı Cron Görevleri: Her kullanıcı için tanımlanmış cron görevlerini listeler.
