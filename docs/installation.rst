*************************
Installation Instructions
*************************

Server or Local Machine Setup:
1) Download python 3.6.* from python website.
   If on ubuntu, install: sudo apt-get install binutils libproj-dev gdal-bin
   Install postgresql 11.3 database and postgis extension and GDAL Complete
   open postgres shell and create a new database (Check DB name from settings file i.e. repos)

2) Create your own virtual environment and install the basic required packages from requirements/base.txt or else
for local machine development install from the development.txt file

2) Create secrets.json file (mandatory) in folder config/settings/, with changes to the values of the keys present in the file.
{ "SECRET_KEY": "", "DATABASE_HOST": "localhost", "DATABASE_USER": "repos_user", "DATABASE_PASSWORD": "" }
For e.g. while setting the server for staging, the "DEFAULT_DATABASE_PASSWORD" will be the staging DB password and for local development it will be your machine's psql’s password and so on for other servers
Try to do python manage.py runserver, It will tell what you are missing in secrets.json

3) Override the DJANGO_SETTINGS_MODULE by exporting it to a settings file. For e.g.
   > For Production Server run the following command from the terminal, export DJANGO_SETTINGS_MODULE='config.settings.production' (To read from the production.py settings file)
   > For Staging Server, export DJANGO_SETTINGS_MODULE='config.settings.staging' (To read from the staging.py settings file)
   > For Local Development, export DJANGO_SETTINGS_MODULE='config.settings.local' (To read from the local.py settings file).
     You can further modify the local settings file as per your needs, by creating your own settings file in
     config/settings/developer_specific/ folder

General Info:
1) middleware.py:
 A middleware was written in utility/middleware.py that intercepts all the incoming/outgoing requests/responses.
 The logging structure has been made a JSON structure so that the log file data can be dumped directly to the ELK stack
