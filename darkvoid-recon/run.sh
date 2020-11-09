#1/bin/sh
# subdomain recon
# usage: ./run.sh <domain.com> 
# all resolved subdomains are outputted to results/subdomains_resolved.txt
# all resolved subdomains and their respective A Record IP addresses are ouputted to results/all_hosts.txt
# 

# subdomain enmeration 
enumerate_subdomains(){
        # my modified copy of drist copies this directory and everything under it back to the local client when the script finishes
        mkdir -p results

        # run several subdomain enumeration tools
        printf "\n------Beginning Subdomain Enumeration-------\n"
        subfinder -silent -rL resolvers.txt -d $1 > results/subfinder.txt
        findomain -qt $1 > results/findomain.txt
        curl -s "https://crt.sh/?q=$1&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' > results/crt.txt
        assetfinder -subs-only $1 > results/assetfinder.txt
        printf "\n------Done-------\n"
#        amass enum -passive -norecursive -noalts -d $1 -o results/amass.txt
        printf "\n--------------------Done--------------------\n"
}

get_js_files(){
        cat subdomains_resolved.txt | gau | grep '\.js$' | httpx -follow-redirects -status-code -mc 200 -content-type -silent | grep 'application/javascript' | awk '{print $1}' | httpx -silent -sr -srd results
        cp -rv results /tmp/
}

enumerate_subdomains $1 && {
	cat results/* | sort -u | shuffledns -silent -r resolvers.txt -d $1 | sort -u > results/subdomains_resolved.txt
	cat results/subdomains_resolved.txt | dnsprobe -silent -r A | sort -u > results/all_hosts.txt
}
