cd /etc/
cat > drop_caches.sh <<EOF
sync
echo 3 > /proc/sys/vm/drop_caches #释放PACECACHE、dAccess和INODE
EOF


cat > crontab <<EOF
*/10 * * * * root /etc/drop_caches.sh
EOF

service cron restart
