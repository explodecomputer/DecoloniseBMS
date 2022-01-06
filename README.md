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

This should build the images and make available a new wordpress install accessible at [http://localhost:9080]

1. Navigate to http://localhost:9080/wp-admin. Setup as usual
2. Install the WPVivid plugin
3. Upload the backup file (e.g. `46.101.75.192_wpvivid-618f7f6db614a_2021-11-13-09-03_backup_all.zip`)
4. Restore

Same process for the deployed site.
