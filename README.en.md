# LinkedIn Certifications Extractor
![Bash](https://img.shields.io/badge/Script-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![curl](https://img.shields.io/badge/Tool-curl-073551?logo=curl&logoColor=white)
![jq](https://img.shields.io/badge/Tool-jq-blue)

A Bash script that extracts all certifications from a LinkedIn profile. It leverages LinkedIn's internal API (`/voyager/api/`) along with authenticated session cookies to retrieve certification data for the specified user.

### Why this script?
- **Zero Frameworks**: No Selenium, Puppeteer, or BeautifulSoup. Pure Bash only.
- **No Cost**: Forget scraping API subscriptions or proxy services.
- **Lightweight**: Runs instantly using native system tools (`curl` + `jq`).
- **Transparent**: No black boxes — you control your cookies and your data.

## Security Considerations

> [!WARNING]

- Cookies contain sensitive session data. Make sure to delete them once you no longer need them.
- Using this script for bulk scraping may violate **LinkedIn's Terms of Service**, which could result in your account being suspended or permanently banned. Use it responsibly.

## Requirements

The script is designed to run on **Unix-like** environments.

- **OS**: Linux, macOS, or Windows (via WSL or Git Bash).
- **Shell**: Bash 4.0+ recommended.
- **Dependencies**: `curl` and `jq`.

| Distribution | Install Command |
| :--- | :--- |
| **Debian / Ubuntu / Mint / Kali** | `sudo apt update && sudo apt install curl jq` |
| **Fedora / CentOS / RHEL** | `sudo dnf install curl jq` |
| **Arch Linux** | `sudo pacman -S curl jq` |
| **Alpine (Docker)** | `apk add curl jq` |

### Cookie file
You need a valid LinkedIn cookie file in Netscape format. We recommend using the [Get cookies.txt LOCALLY](https://github.com/kairi003/Get-cookies.txt-LOCALLY) browser extension (available for Chrome and Firefox).

- Log in to LinkedIn.
- Export your cookies to a `.txt` file.
- Tip: For convenience, save the file in the same directory as the script.

## Usage

```bash
chmod +x curl-lnkin.sh
./curl-lnkin.sh <USERNAME> <COOKIES_FILE>
```

## Output

The script generates a `certifications.json` file consolidating all extracted certifications.

Example structure:
```json
[
  {
    "entityUrn": "urn:li:fs_certification:(ACoAACCzWIAB9uWWHF_lPGIflKJZD6pCJWFHs8s,2063692772)",
    "authority": "Oracle",
    "name": "Oracle Cloud Infrastructure 2025 Certified Foundations Associate",
    "timePeriod": {
      "startDate": {
        "month": 10,
        "year": 2025,
        "$type": "com.linkedin.common.Date"
      },
      "$type": "com.linkedin.voyager.common.DateRange"
    },
    "licenseNumber": null,
    "*company": "urn:li:fs_miniCompany:1028",
    "displaySource": "oracle.com",
    "companyUrn": "urn:li:fs_miniCompany:1028",
    "url": "https://catalog-education.oracle.com/pls/certview/sharebadge?id=BF3AA6CC7DCBD6857D44F838D1259E3C12FAF45C8B35760AF5CE47F6EDAF84F7",
    "$type": "com.linkedin.voyager.identity.profile.Certification"
  },
  {
    "entityUrn": "urn:li:fs_certification:(ACoAACCzWIAB9uWWHF_lPGIflKJZD6pCJWFHs8s,884353105)",
    "authority": "Alura Latam",
    "name": "Programa ONE Tech Foundation G8 - Back End",
    "timePeriod": {
      "startDate": {
        "month": 8,
        "year": 2025,
        "$type": "com.linkedin.common.Date"
      },
      "$type": "com.linkedin.voyager.common.DateRange"
    },
    "licenseNumber": "ae3a1b9f-1f56-490d-8ac9-fa0b01d4bf38",
    "*company": "urn:li:fs_miniCompany:72220241",
    "displaySource": "aluracursos.com",
    "companyUrn": "urn:li:fs_miniCompany:72220241",
    "url": "https://app.aluracursos.com/program/certificate/ae3a1b9f-1f56-490d-8ac9-fa0b01d4bf38?lang",
    "$type": "com.linkedin.voyager.identity.profile.Certification"
  },
  ...
] 
```

## Roadmap

Potential improvements for future versions:
- [ ] URN resolution (reference ID lookups)
- [ ] Automatic retries on failure
- [ ] Detailed file-based logging

## License

This script is provided "as is" without any warranties. Use it at your own risk.

## Contributing

If you run into issues or have improvements in mind, feel free to open a report.

-----
Developed for educational purposes by Sjlvanq [[GitHub](https://github.com/sjlvanq) | [LinkedIn](https://www.linkedin.com/in/sjlvanq)]
