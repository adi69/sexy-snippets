###Error 1:
	
```
Error: The locale requested by the environment is invalid.
Error: could not create default cluster. Please create it manually with

  pg_createcluster 9.3 main --start
```

**Solution:** <br>

1. add the following in `/etc/environment`: <br>
	
	```
	LC_MESSAGES=en_US.UTF-8
	LC_ALL=en_US.UTF-8
	```
	
2. `sudo reboot` 
3. `sudo service postgresql restart` (to refresh with changed settings)

    init** <BR>
In Unix-based computer operating systems, init (short for initialization) is the first process started during booting of the computer system. Init is a daemon process that continues running until the system is shut down.

### Error 2:

`$ psql -U postgres` ->
`psql: FATAL:  Peer authentication failed for user "postgres"`

1. **Solution 1:** `sudo -u postgres psql` (login as a system user instead of postgresql role)

2. [**Solution 2:**](http://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge) <br>
The problem is in `pg_hba.conf` file (`/etc/postgresql/9.3/main/pg_hba.conf`) <br>

	```
	local   all             postgres                                peer
	```
should be

	```
	local   all             postgres                                md5
	```

	>
**Peer authentication** <br>
The peer authentication method works by obtaining the client's operating system user name from the kernel and using it as the allowed database user name (with optional user name mapping). This method is only supported on local connections.
	>
**Password authentication** <br>
The password-based authentication methods are md5 and password. These methods operate similarly except for the way that the password is sent across the connection, namely MD5-hashed and clear-text respectively.

	After altering this file `sudo service postgresql restart`


###PROBLEM 2: 
    
####Problem:
`/vagrant/` is empty
    
####Diagnosis:
If you do sudo apt get update, then, it updates the kernel. You need to rebuild the vbox kernel modules for shared folders to work. 

####Solution:
1. just vagrant halt and then vagrant up.

```
# Share an additional folder to the guest VM. The first argument is
# the path on the host to the actual folder. The second argument is
# the path on the guest to mount the folder. And the optional third
# argument is a set of non-required options.
# config.vm.synced_folder "../data", "/vagrant_data"

config.vm.synced_folder "/Users/apple/Documents/Projects/freshbury_grofers/", "/vagrant_hot"
```