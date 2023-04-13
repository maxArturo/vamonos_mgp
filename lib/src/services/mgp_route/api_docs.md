# MGP API

THis is the api located at POST https://appsl.mardelplata.gob.ar/app_cuando_llega/webWS.php and usually accessed through the web/bundled app located at https://appsl.mardelplata.gob.ar/app_cuando_llega/webRecorridos.php.

The known data models, route structures, and endpoints are documented below.

## Data structure

### Route

The top-level entity is a `Route`, which confusingly is not a path from one starting location to a destination. Instead, it is a generalized grouping of actual start-to-end paths that _roughly_ take the same heading, but vary slightly depending on the actual path and start/end locations. The IDs look like this:

    511: String

and the endpoint that provides the canonical list of `Route`s is the following:

```shell
curl --compressed 'https://appsl.mardelplata.gob.ar/app_cuando_llega/webWS.php' -X POST -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/109.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate' -H 'Referer: https://appsl.mardelplata.gob.ar/app_cuando_llega/cuando.php' -H 'Origin: https://appsl.mardelplata.gob.ar' -H 'Connection: keep-alive' -H 'Cookie: PHPSESSID=rjljvqj7b7vrmap6evep0nc3t8; __cf_bm=4yDKup97sonVp5pR9rMQVaEU_KSh8ucn00McIzR5Dow-1676462283-0-AfgfKUSRm5l68WPngghnZwPxghOmVe0XSV/HEcFQUTmBlmOQUcVIvDdxfBmQxFm2mrlThWuAyr0sBrKXJ0fQswhLp28iqxEKz3Rd1UlzEDQD3wvoBGUVrKarwO2zfLqVZIIgocuE0HEzmguuMVP44jI=' -H 'Sec-Fetch-Dest: empty' -H 'Sec-Fetch-Mode: no-cors' -H 'Sec-Fetch-Site: same-origin' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'X-Requested-With: XMLHttpRequest' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --data-raw 'accion=RecuperarLineaPorCuandoLlega'
```

response:

```json
{
  "CodigoEstado": 0,
  "MensajeEstado": "ok",
  "lineas": [
    {
      "CodigoLineaParada": "93",
      "Descripcion": "501",
      "CodigoEntidad": "10",
      "CodigoEmpresa": 13
    },
    {
      "CodigoLineaParada": "98",
      "Descripcion": "511",
      "CodigoEntidad": "10",
      "CodigoEmpresa": 13
    },
    {
      "CodigoLineaParada": "99",
      "Descripcion": "512",
      "CodigoEntidad": "10",
      "CodigoEmpresa": 13
    }
    //...
  ]
}
```

where

- `CodigoLineaParada`: route id
- `Descripcion`: route name
- `CodigoEntidad`: company code (presumably)

### Directed Route

Ok, this is where it gets fun.

```shell
curl --compressed 'https://appsl.mardelplata.gob.ar/app_cuando_llega/webWS.php' -X POST -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/110.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' 'Referer: https://appsl.mardelplata.gob.ar/app_cuando_llega/webRecorridos.php' --data-raw 'accion=RecuperarRecorridoParaMapaAbrevYAmpliPorEntidadYLinea&codLinea=344&isSublinea=0'
```

```json
{
  "CodigoEstado": 0,
  "MensajeEstado": "ok",
  "puntos": [
    {
      "Descripcion": "1;715 A MDP;CHAPADMALAL IDA X YPF X PQ",
      "AbreviaturaBanderaSMP": "CHAP IDA P",
      "AbreviaturaLineaSMP": "BATAN",
      "IsPuntoPaso": true,
      "Latitud": -38.007132,
      "Longitud": -57.720226
    }
    //...
  ]
}
```

There is no actual endpoint to get a directed route - it _must_ be built out of this API response. This API actually returns directed route landmarks for all directed routes in a parent route (this is used also to build a map polyline for the directed route from this, see [route landmark](#directed-route-landmark) below). The `Descripcion` field is a pseudomodel that contains the following data (semicolon delimited via `.split(';')`):

0. ordering index (not sure how used)
1. destination
2. origin

Using the above you can construct the only true directed route identifier that can be used to build polylines and show meaningful data. In the example above, the following JS function is used in the source code to generate a directed route label:

```js
function armarBandera(bandera) {
  var origenDestino = bandera.split(';');
  var banderaFinal = origenDestino[2];
  if (origenDestino[1].charAt(0).indexOf('-') == -1) {
    banderaFinal += ' por ' + origenDestino[1];
  }

  return banderaFinal;
}
/**
 * > armarBandera(res.Descripcion)
'CHAPADMALAL VTA por 715 A BATAN'
 */
```

### Directed Route Landmark

from the API request above we can see an actual directed route stop landmark. Useful to show in the map for a visual representation of a directed route, since you can collect all objects that share the same directed route (obtained via the pseudocode above) and use that to create a polyline plotted in a map.

### Directed Route Stop

To get the actual stops, there's a separate API:

```shell
curl 'https://appsl.mardelplata.gob.ar/app_cuando_llega/webWS.php' -X POST -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/110.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Referer: https://appsl.mardelplata.gob.ar/app_cuando_llega/webRecorridos.php'  --data-raw 'accion=RecuperarParadasConBanderaYDestinoPorLinea&codLinea=108&isSublinea=0'
```

```json
{
  "CodigoEstado": 0,
  "MensajeEstado": "ok",
  "paradas": {
    "10054": [
      {
        "Codigo": "15056",
        "Identificador": "10054",
        "Descripcion": "AL PUERTO",
        "AbreviaturaBandera": "AL REGIONAL X 2AB",
        "AbreviaturaAmpliadaBandera": "AL REGIONAL X 2AB",
        "LatitudParada": "-38.005082",
        "LongitudParada": "-57.544477"
      }
      //...
    ]
  }
}
```

Similarly to the directed route landmarks, the directed route stops also use a string generated from string fields to identify the directed route it belongs to. In this case:

```js
var directedRoute = armarBandera(
  ';' +
    paradaActual[i].AbreviaturaBandera +
    ';' +
    paradaActual[i].AbreviaturaAmpliadaBandera
);
```

You can overlay this data on top of a polyline to get the full layout of the stops.

## proxy setup

we're using a proxy to make sure we have control of caching/throttling and avoiding issues with upstream providers. the URIs look like the below

```
MGP_ROUTE_API_URL=http://localhost:8080/providers/mgp/app_cuando_llega/webWS.php
OSM_API_URL=http://localhost:8080/map_tiles/osm
```
