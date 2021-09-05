# DecoloniseBMS resources website

This website hosts resources for the decolonisation work undergoing at the Bristol Medical School.

## Acknowledgements

Many thanks to the contributors of open source software that is used here:

* [Wordpress](https://wordpress.com/)
* [Noto-simple wordpress theme](https://en-gb.wordpress.org/themes/noto-simple/)
* [Wordpress docker hub](https://hub.docker.com/_/wordpress)
* [Updraftplus wordpress plugin](https://updraftplus.com/)

## Secrets

Need a file called `secrets.env` in the main directory that looks like:

```
MYSQL_ROOT_PASSWORD=VALUE
MYSQL_PASSWORD=VALUE
MYSQL_USER=wordpress
MYSQL_DATABASE=wordpress
WORDPRESS_DB_USER=wordpress
WORDPRESS_DB_PASSWORD=VALUE
WORDPRESS_DB_NAME=wordpress
```

## Development

Writing PHP files etc needs to be done locally for convenience, and the data / content needs to be generated in the deployed location so that others can contribute. That means that when developing locally we need to migrate the database back to the local environment and setup from there.

The theme code is in github which is mounted as a volume in the docker container, so local development can be done relatively simply by editing the github repo files locally as usual.

```
git clone git@github.com:explodecomputer/DecoloniseBMS.git
cd DecoloniseBMS
docker-compose up -d
```

This should build the images and make available a new wordpress install accessible at [http://localhost:8080]

Setting up for local or deployed instance

0. From the deployed site we need to download the data / content files. Go to the main site `wp-admin` and use the updraftplus plugin to download the following components:
    - db
    - uploads
    - plugins
    - other
1. Make sure that the backup files are in the `backup` folder. They look like this:
    - `backup_2021-09-05-0802_DecolBMS_b3b551fb4bfe-db.gz`
    - `backup_2021-09-05-0802_DecolBMS_b3b551fb4bfe-others.zip`
    - `backup_2021-09-05-0802_DecolBMS_b3b551fb4bfe-plugins.zip`
    - `backup_2021-09-05-0802_DecolBMS_b3b551fb4bfe-uploads.zip`
2. Note that the backup db file has hard-coded URLs in it. So we need to update them using
    ```
    ./migrate.sh <hostURL> localhost:8080
    ```
3. Navigate to http://localhost:8080/wp-admin/
4. Install updraftplus plugin
5. Activate updraftplus plugin
6. Upload backup files
    - db
    - uploads
    - plugins
    - other
7. Restore from these files.
8. May need to change the theme to noto-simple

