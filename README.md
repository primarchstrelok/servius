# Usage:

## Sending Files Locally:

First you must add a rule to the firewall allowing outbound traffic on port 8000
On ubuntu:
```bash
$ sudo ufw allow 8000
```
Then you must target the directory or file that you want to serve to the network with the `-l` flag
```bash
$ bash servius.sh -l target-file-location
```
This will zip the targeted directory and host it on your ip, to access it on the clientside go to the server's IP on their web browser with port 8000 on the end of the URL, For example http://192.168.1.6:8000

Selecting the desired ZIP file will download it to the client's computer

## Sending Files over Internet:

Target the directory or file with servius and the `-i` flag
```bash
$ bash servius.sh -i target-file-location
```
This will return a code phrase that can be recieved by a Croc on a Client. This will require the client to have Croc installed on their device. With Croc installed run:
```bash
$ croc code-phrase
```
Then confirm that you want to download the file by selecting Y
