# MGP api notes

## Sample API request

```shell
curl --compressed 'https://appsl.mardelplata.gob.ar/app_cuando_llega/webWS.php' -X POST -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/109.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate' -H 'Referer: https://appsl.mardelplata.gob.ar/app_cuando_llega/cuando.php' -H 'Origin: https://appsl.mardelplata.gob.ar' -H 'Connection: keep-alive' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: no-cors' -H 'Sec-Fetch-Site: same-origin' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'X-Requested-With: XMLHttpRequest' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --data-raw 'accion=RecuperarLineaPorCuandoLlega'
```

response:

```json
{"CodigoEstado":0,"MensajeEstado":"ok","lineas":[{"CodigoLineaParada":"93","Descripcion":"501","CodigoEntidad":"10","CodigoEmpresa":13},{"CodigoLineaParada":"98","Descripcion":"511","CodigoEntidad":"10","CodigoEmpresa":13},{"CodigoLineaParada":"99","Descripcion":"512","CodigoEntidad":"10","CodigoEmpresa":13},{"CodigoLineaParada":"100","Descripcion":"521","CodigoEntidad":"10","CodigoEmpresa":13},{"CodigoLineaParada":"101","Descripcion":"522","CodigoEntidad":"10","CodigoEmpresa":13},{"CodigoLineaParada":"102","Descripcion":"523","CodigoEntidad":"10"
[...]
```

looks like the only truly needed parts are the referrer and so on:

```shell
curl 'https://appsl.mardelplata.gob.ar/app_cuando_llega/webWS.php' -X POST -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/109.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate' -H 'Referer: https://appsl.mardelplata.gob.ar/app_cuando_llega/cuando.php' -H 'Origin: https://appsl.mardelplata.gob.ar' -H 'Connection: keep-alive' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: no-cors' -H 'Sec-Fetch-Site: same-origin' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'X-Requested-With: XMLHttpRequest' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --data-raw 'accion=RecuperarLineaPorCuandoLlega'
```
