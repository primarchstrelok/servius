#!/bin/bash
while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - attempt to serve file"
      echo " "
      echo "$package [option] target-file [-p (optional)] [port (optional)]"
      echo " "
      echo "options:"
      echo "-h, show help page"
      echo "-l, locally serve file"
      echo "-i, serve file over internet"
      echo "-d, host dedicated server"
      echo "-p, specify a port otherwise default to 8000"
      exit 0
      ;;
    -l)
      shift
      zip -r $1.zip $1
      mkdir serve
      mv $1.zip serve
      if [$1 = "-p"]
      shift
      then
        python3 -m http.server $1 --directory serve/
      else
        python3 -m http.server 8000 --directory serve/
      fi
      shift
      ;;
    -i)
      shift
      zip -r $1.zip $1
      croc send $1.zip
      shift
      ;;
    -d)
      shift
      docker run -d --init --name css-dedicated --restart unless-stopped -v css-dedicated-config:/var/css/cfg -p 27015:27015 -p 27015:27015/udp -e RCON_PASSWORD=mypassword -e CSS_PASSWORD=mypassword -e CSS_HOSTNAME=myservername -e PORT=27015 nilsramsperger/counterstrike-source-dedicated
      shift
      ;;
    *)
      break
      ;;
  esac
done
