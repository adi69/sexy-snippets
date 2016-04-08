
#_Picking coins along the way..._

> Topics: Mac OSX, MySQL, Django, Git, Python, MongoDB, Unix, Postgres

##Tips for Coding
- Go back through and write a comment on what each line does.
- Read each one backward or out loud to find your errors.
- Write down on a piece of paper what kind of mistake you made.

##Mac OSX
* `/usr/local/bin` The place where all the terminal commands are there. I think similiar to django manangement commands.
* Setting locales correctly on Mac OSX Terminal application: write the following in ~/.zshrc or ~/.bashrc `export LANG=en_US.UTF-8
export LC_CTYPE=”en_US.UTF-8″
export LC_NUMERIC=”en_US.UTF-8″
export LC_TIME=”en_US.UTF-8″
export LC_COLLATE=”en_US.UTF-8″
export LC_MONETARY=”en_US.UTF-8″
export LC_MESSAGES=”en_US.UTF-8″
export LC_PAPER=”en_US.UTF-8″
export LC_NAME=”en_US.UTF-8″
export LC_ADDRESS=”en_US.UTF-8″
export LC_TELEPHONE=”en_US.UTF-8″
export LC_MEASUREMENT=”en_US.UTF-8″
export LC_IDENTIFICATION=”en_US.UTF-8″
LC_ALL=`
* **System Integrity Protection(SIP) (for El Capitan OS) ---** Apple has enabled a new security oriented feature, often called rootless, in OS X 10.11 onward. It locks down specific system level locations in the file system while simultaneously preventing certain processes from attaching to system-level processes. <br>It locks down the following system level directories in OS X: `/System`, `/sbin`, `/usr` (with the exception of /usr/local subdirectory)

	> Reboot the Mac and hold down `Command + R` keys simultaneously after you hear the startup chime, this will boot OS X into _Recovery Mode_. <br>
When the “OS X Utilities” screen appears, pull down the ‘Utilities’ menu at the top of the screen instead, and choose “Terminal”<br> Type the following command into the terminal then hit return: `csrutil disable; reboot`<br>

* `Command + Option + Escape` : Task Killer


##Unix Commands
* **Recursively delete all files of a specific extension in a directory ---**
`find . -name "*.extension" -type f -print0 | xargs -0 /bin/rm -f` or<br>
`find find /var/tmp/stuff -delete` or 
`rm **/*.extension`
* `rm -r dir` (to Recursively remove directory and contents)
* `find . -name "foo*"`

##Django
* **Django Commands** <br>
The ```python manage.py <command>``` stored in `app > management > commands` in file with `<command-name.py>` containing class `Command` inheriting from class `BaseCommand`. Define what the command does in function `handle()`

```Python
    from django.core.management import BaseCommand

    #The class must be named Command, and subclass BaseCommand
    class Command(BaseCommand):
	    # Show this when the user types help
	    help = "My test command"
	
	    # A command must define handle()
	    def handle(self, *args, **options):
	    self.stdout.write("Doing All The Things!")
```

* If you are adding a new column to a model, then make sure to add a default. If you don’t want the default remove it later. BUT, do it! then python manage.py makemigrations and then migrate
* **related_name**<br>
	It specifies the name of the reverse relation from the other model to model with foreign key.
If you don't specify a related_name, Django automatically creates one using the name of your model with the suffix `_set`.
* **FloatField vs DecimalField** [Link](http://stackoverflow.com/questions/2569015/django-floatfield-or-decimalfield-for-currency) Always use DecimalField for money. The FloatField class is sometimes mixed up with the DecimalField class. Although they both represent real numbers, they represent those numbers differently. FloatField uses Python’s float type internally, while DecimalField uses Python’s Decimal type
* **File "/Library/Python/2.7/site-packages/django/core/checks/urls.py", 
AttributeError: 'str' object has no attribute 'regex' --** to comment something inside urlpatterns don't use `'''` as it is a string and not a comment. Use `#`
* **`blank=True` vs `null=True` --** [Link](http://stackoverflow.com/questions/8609192/differentiate-null-true-blank-true-in-django)
 
##Git
* **Push ERROR: Repository not found** <br>
Check to see if you have *read-write access*
* `git push <remote-name> <local-branch-name>:<remote-branch-name>`

##Python
* classes must be defined before they can be accessed. So the code of a class definition must be above the line where it is accessed.
* **\_\_repr__ vs \_\_unicode__ vs \_\_str__ ---** unicode and str are same except unicode returns character and str returns bytes. One character maybe more than one byte, so, use unicode. repr is for developers while str is for customers. repr is used to disambiguate between objects. a class can live without str but not without repr. by default str is set to str=repr.  
* **Check the type of a Python variable ---** 
`isinstance(x, dict)` /
`type(s) is dict`
* **Check Version of Python Package ---**
`pip freeze | grep <package-name>`
* **Python Packages Directory ---** `System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/`
* **Install New Package from setup.py ---** `python setup.py install`
* **Install packages from requirements.txt ---** `pip install -r path/to/requirements.txt`
* **[Errno 1] Operation not permitted---** `pip install --ignore-installed <package-name>` don't do this. Might create complications. this error occurs because of reason specified below.
* When getting permission denied thing (due to SIP):
	* Method 1: described above (disabling SIP)
	* Method 2 (if you don't wanna disable SIP): <br>
		Instead of system installed python, do `brew install python`
		[Link](https://joernhees.de/blog/2014/02/25/scientific-python-on-mac-os-x-10-9-with-homebrew/)	
		
		```
		which python 
		#should say /usr/local/bin/python
		echo $PATH 
		#/usr/local/bin should appear in front of /usr/bin
		```
		
		else add `PATH="/usr/local/bin:${PATH}"` to _~/.zprofile_
(will prepend /ur/local/bin to path variable

	* Method 3: Install with pip's --user option, or using a **virtualenv** - that's best practice for most folks anyway.

## PyMongo

```Python
from pymongo import MongoClient
client = MongoClient()
db = client.db_name
cursor = db.collection_name.find()
cursor2 = db.restaurants.find({"key": "value"})
for document in cursor:
    print(document)
```

##MongoDB
* **Starting Server ---** `mongod --dbpath ~/data/db` 

##MySQL
`mysql.server start` <br>
`mysql -u username`
 
##Postgres

* **List DBs ---** `psql -l`
* **Login Postgres ---** `sudo -u <system_account_user> psql <database>`
* **List DBs ---**`\l`, **List roles ---** `\du`
* **_IMPORTANT: NEVER FORGET THE ';' AFTER COMMAND_**
* **Create Roles ---** `CREATE USER <role-name> SUPERUSER;` <br> `CREATE DATABASE <db-name> WITH OWNER <role-name>;` (Private Database)
* **Change Password ---** `alter user "role" with password 'pswd';` (note double quotes for user and single quotes for password)
* **Import postgres dump ---** `psql database-name < ~/Downloads/db.sql`
* **Export postgres dump ---** `pg_dump database-name > ~/Downloads/db.sql`
* **Switch Database ---** `\connect DBNAME`
* **Run server ---** in linux `sudo service postgresql restart`
