Automated passive subdomain enumeration using the following tools and their sources:
- subfinder
- findomain
- assetfinder
- amass

Domains are checked against a custom public list of resolvers. Only domains that resolve will be saved. 

# Example usage
```
$ docker run -v $(pwd):/opt/subs/results -it wfnintr/subs target.com
1view.target.com
2daysweepstakes.target.com
abnprevprodpromov1.global.tgt-pe-prod.gcp.cloud.target.com
abnprevprodpromov1.global.tgt-pe-test.gcp.cloud.target.com
abnprevpromov1.global.tgt-pe-prod.gcp.cloud.target.com
abnprevpromov1.global.tgt-pe-test.gcp.cloud.target.com
abnprodpromov1.global.tgt-pe-prod.gcp.cloud.target.com
abnprodpromov1.global.tgt-pe-test.gcp.cloud.target.com
abnpromoitemv1.global.tgt-pe-prod.gcp.cloud.target.com
abnpromoitemv1.global.tgt-pe-test.gcp.cloud.target.com
abnpromov1.global.tgt-pe-prod.gcp.cloud.target.com
abnpromov1.global.tgt-pe-test.gcp.cloud.target.com
... (redacted)
```

Results are sent to stdout and saved to the file in cwd `subs.result`
