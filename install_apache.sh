sudo yum -y update
sudo yum -y install httpd
sudo service httpd start

cat > /var/www/html/index.html <<- "EOF"
<!doctype html>
<html>
<head>
    <title>mlaane</title>
    <meta name="description" content="Our first page">
    <meta name="keywords" content="html tutorial template">
</head>

<body>
    ica0017
</body>
</html>
EOF

cat > /var/www/html/error.html <<- "EOF"
<!doctype html>
<html>
<head>
    <title>ERROR</title>
    <meta name="description" content="Our first page">
    <meta name="keywords" content="html tutorial template">
</head>

<body>
    Something went wrong
</body>
</html>
EOF

aws s3 sync /var/www/html/ s3://mlaane