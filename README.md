# Web Fetch

## Setup

```
docker build . -t web-fetch
```

## Usage

```
docker run -v `pwd`/pages:/app/pages web-fetch "./fetch" --metadata https://pro.sabu.fr
```

## Notes

- HTML pages are saved in the `pages` folder.
- The command accepts 1 or 2 parameters, in any order.
- URLs with path are accepted (`http://www.example.com/path/to/page`).
- Without the `--metadata` flag, the command will simply download the HTML page, save it locally and exit.
- With the `--metadata` flag
  - if the HTML page already exists locally, metadata will be fetched from the local version.
  - if the HTML page does not exist locally, metadata will be fetched from a freshly downloaded version.

### Dependencies

- [Nokogiri](https://nokogiri.org/): HTML parsing
- [HTTParty](https://github.com/jnunemaker/httparty): Easy HTTP requests
