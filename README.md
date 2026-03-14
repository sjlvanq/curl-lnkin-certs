# LinkedIn Certifications Extractor
![Bash](https://img.shields.io/badge/Script-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![curl](https://img.shields.io/badge/Tool-curl-073551?logo=curl&logoColor=white)
![jq](https://img.shields.io/badge/Tool-jq-blue)

Script bash que extrae todas las certificaciones de un perfil de LinkedIn. Utiliza la API interna de LinkedIn (`/voyager/api/`) junto con cookies de sesión autenticadas para acceder a los datos de certificaciones del usuario especificado.

### ¿Por qué este script?
- Zero Frameworks: Sin Selenium, Puppeteer o BeautifulSoup. Solo Bash puro.
- Sin Coste: Olvida las suscripciones de APIs de scraping o servicios de proxy.
- Ligero: Ejecución instantánea con herramientas nativas del sistema (curl + jq).
- Transparente: Sin cajas negras; tú controlas tus cookies y tus datos.

## Consideraciones de seguridad

> [!WARNING]

- Las cookies contienen información de sesión sensible. Asegúrate de eliminarlas cuando ya no las necesites.
- El uso de este script para scraping masivo puede violar los **Términos de Servicio de LinkedIn**, lo que podría resultar en la suspensión o el bloqueo de tu cuenta. Úsalo con moderación.

## Requisitos

El script está diseñado para ejecutarse en entornos **Unix-like**.

- **Sistema Operativo**: Linux, macOS, o Windows (utilizando WSL o Git Bash).
- **Intérprete**: Bash 4.0+ recomendado.
- **Dependencias**: `curl` y `jq`.

| Distribución | Comando de Instalación |
| :--- | :--- |
| **Debian / Ubuntu / Mint / Kali** | `sudo apt update && sudo apt install curl jq` |
| **Fedora / CentOS / RHEL** | `sudo dnf install curl jq` |
| **Arch Linux** | `sudo pacman -S curl jq` |
| **Alpine (Docker)** | `apk add curl jq` |

### Archivo de cookies
Necesitas un archivo de cookies válidas de LinkedIn en formato Netscape. Recomendamos usar la extensión de navegador [Get cookies.txt LOCALLY](https://github.com/kairi003/Get-cookies.txt-LOCALLY) (disponible para Chrome y Firefox).

- Inicia sesión en LinkedIn
- Exporta las cookies a un archivo `.txt`. 
- Tip: Para mayor comodidad, guarda el archivo en el mismo directorio donde se encuentra el script.

## Uso

```bash
chmod +x curl-lnkin.sh
./curl-lnkin.sh <USERNAME> <COOKIES_FILE>
```

## Salida

El script genera un archivo JSON `certifications.json` consolidando todas las certificaciones extraídas.

Estructura de ejemplo:
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

## Mejoras futuras

Posibles mejoras para el script:
- [ ] Resolución de URNs (IDs referenciales)
- [ ] Reintentos automáticos en caso de error
- [ ] Logging más detallado en archivos

## Licencia

Este script es proporcionado "tal cual" sin garantías. Úsalo bajo tu propio riesgo.

## Contribuciones

Si encuentras problemas o tienes mejoras, siéntete libre de reportarlas.

-----
Desarrollado con fines educativos por Sjlvanq [[GitHub](https://github.com/sjlvanq) | [LinkedIn](https://www.linkedin.com/in/sjlvanq)]
