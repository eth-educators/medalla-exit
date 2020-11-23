# Thank you for testing

With Medalla testnet coming to a close, the cloud beacon for this project has been shut down. You can, of course, use this
general idea with a beacon of your own.

# Voluntary exit from Medalla testnet

This project provides a workflow to exit validators that were created
by eth2.0-deposit-cli from Medalla testnet, using your `keystore-m`
JSON files and your password. All secrets are kept local on your machine.
A cloud-located beacon node is used to deliver the exit message,
although you can configure the project to use your own beacon.

The project assumes that you accept Prysm's [TOS](https://github.com/prysmaticlabs/prysm/blob/master/TERMS_OF_SERVICE.md).
If you object to their TOS, please do not use this project.

## Prerequisites

This project has been tested on Linux, and should work on MacOS and
Windows 10.

### Linux

You need git, docker, and docker-compose. Assuming Ubuntu:

`sudo apt update && sudo apt install -y git docker docker-compose`

### MacOS

You will need Docker Desktop and Git.

### Windows 10

You will need Docker Desktop, Git, Python 3, and WSL 2. WSL 2 and Python 3
can be installed from the Microsoft Store.

## Use

### Clone the project

Assuming that the project will go into your home directory:

`cd ~; git clone https://github.com/eth2-educators/medalla-exit.git; cd medalla-exit`

### Optional: Adjust variables

The file `.env` contains the location of the cloud beacon node. If you'd rather
provide your own Prysm beacon node, edit that file.

> The project assumes the node is providing a secure connection. If yours
> does not, edit `.eth2/process-exit.sh` and remove the `--tls-cert` parameter.

### Copy keys to be exited

Copy keys of validators that you wish to exit into `.eth2/validator_keys`. This
project supports keys created by eth2.0-deposit-cli, they will have a name that
starts with `keystore-m` and ends in `.json`.

> If your keys do NOT all have the same password, you may want to do this in
> batches. This project assumes that all keys in `.eth2/validator_keys` have
> the same password.

### Run the exit procedure

Run `sudo docker-compose run validator-voluntary-exit`. This will import your
keys and then exit your validators. Prysm will prompt you to navigate to a web
site and input a phrase that confirms that you understand that this process
cannot be reversed.

- When asked for a wallet directory, accept the default
- When asked for a wallet password, choose any you like. It will be used
  during voluntary exit, and then never again.
- Provide the password for the keystore file(s).

> This project does not store a wallet after it completes, all wallet
> files are destroyed after successful exit


LICENSE: MIT
