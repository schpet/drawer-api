# Drawer Server


## TODO

- tests
- instructions to boot/test the app
- document what S3 config is needed (CORS, IAM policy examples)
- max upload size (env var with reasonable fallback)
- api versioning via headers (`Accept: application/vnd...`)
- work with non-org github auth (i.e. ENV vars controlling access, or whitelist
  in db)

- explain why this is needed

```
bin/rails s -b 127.0.0.1
```

- walk thru github oauth steps

example s3 cors config:

```
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <CORSRule>
        <AllowedOrigin>http://drawer-client-app.biz</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <AllowedMethod>POST</AllowedMethod>
        <AllowedMethod>PUT</AllowedMethod>
        <AllowedHeader>*</AllowedHeader>
    </CORSRule>
</CORSConfiguration>
```
