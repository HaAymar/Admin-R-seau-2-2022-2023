$ORIGIN woodytoysa.com.
$TTL    604800
@   IN  SOA  woodytoysa.com. admin.woodytoysa.com. (
         2022060701     ; Serial
              43200     ; Refresh
               7200     ; Retry
            2419200     ; Expire
              86400 )   ; Negative Cache TTL



;NS
@       IN      NS      ns.woodytoysa.com.
@       IN      A       20.0.212.73
ns      IN      A       20.0.212.73


;Web
www     IN      A       20.0.212.73
b2b     IN      A       20.0.212.73
