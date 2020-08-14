## Setting up

First, ssh into your server.

```bash
ssh root@<server_ip>
```

Then, clone this repository.

```bash
git clone https://github.com/oguzgelal/remote2.git
cd remote2
```

Before installation, create the `.env` file from the given `.env.sample` file and modify it to your needs

```bash
cp .env.sample .env
nano .env
```

Now, start the installation. This will install docker and docker compose on the host machine, and create the code-server container. If you're on a host machine that already has docker installed, you can skip this command and run the `docker-compose` command at the last line.

```bash
./start.sh
```

Now, open *http://server_ip:8443* to launch code-server, and open up the built-in terminal. This will give you terminal access to the running container, which will be our development machine.


Last step is to run the script that sets up the dev environment.

```bash
cd /setup && ./setup
```

## Notes to self


* This setup should support running on both a local machine, or a VM.
* The development container should be considered volatile. The installation script that runs in the container should be able to install everything that's needed for development (n, node, npm, expo-cli etc). If a dependency is added or removed, the installation script should be updated accordingly. For persistence of software settings and configuration, the necessary dotfiles should be kept in a directory on the host machine that is mounted in the container, and symlinks should be used to link the dotfiles to their actual locations. The linking process should also be automated in the setup script. 
* The host machine (local or VM) should also be considered volatile. Volumes that are mounted in the container should be kept in the directory cloned from git. Changes made from the container to the persisted files (dotfiles, setup script etc.) should be visible to git, and pushing those changes from the cloned directory should push everything that needs to be persisted upstream. Files to be persisted should be kept in dedicated directories that were made visible to git, and other volumes that are mounted in the container should be added in the `data` directory, which is included in .gitignore. This is to ensure that unnecessary files won't get pushed upstream.
* Both the container and VM should be recreated occasionally.
* Installing latest versions of dependencies should be avoided, instead, specific versions should be installed. This is to ensure that the same environment would be created after every setup consistently. 


