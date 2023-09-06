kubectl cp ./db/ sql-service-postgresql-0:/tmp
for file in `ls db/*`; do
    kubectl exec -i sql-service-postgresql-0 -- bash -c "PGPASSWORD='$POSTGRES_PASSWORD' psql --host 127.0.0.1 -U postgres -d postgres -p 5432 -f /tmp/$file"
done