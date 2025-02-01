export $(cat .env | xargs)
export MLFLOW_S3_ENDPOINT_URL=https://storage.yandexcloud.net
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_BUCKET_NAME=$STUDENT_S3_BUCKET

echo "Запускаем MLflow с бакетом: s3://$STUDENT_S3_BUCKET"

mlflow server \
    --backend-store-uri postgresql://mle_20241219_a60d0b01a0:e1b4b5c40ab84dcc8dfe8b926160a092@rc1b-uh7kdmcx67eomesf.mdb.yandexcloud.net:6432/playground_mle_20241219_a60d0b01a0 \
    --registry-store-uri postgresql://mle_20241219_a60d0b01a0:e1b4b5c40ab84dcc8dfe8b926160a092@rc1b-uh7kdmcx67eomesf.mdb.yandexcloud.net:6432/playground_mle_20241219_a60d0b01a0 \
    --default-artifact-root s3://$STUDENT_S3_BUCKET \
    --no-serve-artifacts