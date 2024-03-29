# Usage:

## Sending Files Locally:

First you must add a rule to the firewall allowing outbound traffic on whichever port you wish to use (By default port 8000)
On ubuntu:
```bash
$ sudo ufw allow <port>
```
Then you must target the directory or file that you want to serve to the network with the `-l` flag
```bash
$ bash servius.sh -l <target-file-location>
```
If you wish to specify a port for the file server add `-p <port>` to the end of the arguments
```bash
$ bash servius.sh -l <target-file-location> -p <port>
```
This will zip the targeted directory and host it on your ip, to access it on the clientside go to the server's IP on their web browser with the selected port on the end of the URL, For example http://192.168.1.6:8000

Selecting the desired ZIP file will download it to the client's computer

## Sending Files over Internet:

Target the directory or file with servius and the `-i` flag
```bash
$ bash servius.sh -i <target-file-location>
```
This will return a code phrase that can be recieved by a Croc on a Client. This will require the client to have Croc installed on their device. With Croc installed run:
```bash
$ croc <code-phrase>
```
Then confirm that you want to download the file by selecting Y

## Sending Files from Windows:

First you will need to activate Windows Subsystems for Linux, This can be done in the Windows Features settings in control panel

You will then need to install a Distro for WSL to use, I recommend the Ubuntu Distro which you can find in the Microsoft Store

Once you have done this, open CMD and navigate to the files you wish to share and then enter `bash`

If this is the first time you are using this WSL Distro install you will need to install the `zip` package to archive files, Do this with
```bash
$ sudo apt install zip
```
You will then need to get the location of the files with `pwd`, make a note of this path

Then navigate to the location where you want to keep servius, i recommend the home directory which you can get to with `cd ~`

Then you will need to Git clone the servius repo with
```bash
$ git clone https://github.com/primarchstrelok/servius
```
From inside the servius directory you can then enter the command to share the files, for example
```bash
$ bash servius.sh -l /mnt/c/Games
```
Windows will then prompt you with a request to allow python through the firewall, you will need to accept this for the server to be accessable from other clients
