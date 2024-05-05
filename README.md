# Práctica Final PROLOG – Sistema experto del metro de Madrid

Práctica final de **Lógica Matemática** (Grado en Ingeniería Informática, CUNEF Universidad).

Programa en Prolog que da soporte a un servicio de información del metro: rutas, paradas, áreas, tarifas de billete y transbordos.

## Contenido

| Archivo | Descripción |
|---|---|
| `pract_final_pablo_gallego.pl` | Programa completo (ejercicios 1 y 3) con las cuestiones del ejercicio 2 comentadas |

## Modelo de datos

| Predicado | Significado |
|---|---|
| `usr_tarifa(Usuario, Tarifa)` | Tarifa cargada por cada usuario (`central` o `global`) |
| `ruta(Ruta)` | Rutas disponibles: amarilla, roja, naranja y azul |
| `parada(Ruta, Parada)` | Paradas que pertenecen a cada ruta |
| `area(Parada, Area)` | Área (`a` o `b`) en la que está cada parada |
| `tarifa_area(Tarifa, Area)` | Qué tarifa es válida en cada área (A: central o global; B: solo global) |
| `conecta_bus(Parada)` | Paradas con conexión a bus |

## Reglas

| Regla | Qué comprueba |
|---|---|
| `transbordo(R1, R2)` | Dos rutas distintas tienen al menos una parada en común |
| `transbordo_en(R1, R2, P)` | Parada concreta `P` en la que se hace el transbordo |
| `llegar(X, Y)` | Se puede ir de `X` a `Y` en la misma ruta o con un transbordo entre sus rutas |
| `puede_usar(Usuario, Parada)` | La tarifa del usuario es válida para el área de la parada |
| `puede_viajar(Usuario, Y, Z)` | El usuario puede usar ambas paradas y se puede llegar de `Y` a `Z` |
| `intercambiador(P)` | En `P` paran dos o más rutas distintas y tiene conexión con bus |

## Cómo ejecutarlo

[SWISH](https://swish.swi-prolog.org/), pegando el contenido del `.pl`.

Las consultas se escriben en el prompt `?-` y terminan en punto.

## Consultas de ejemplo

```prolog
transbordo(roja, azul).                    % true
puede_viajar(mario, sol, cuatro_caminos).  % true
puede_viajar(eva, sol, cuatro_caminos).    % false
transbordo_en(roja, amarilla, P).          % P = sol
setof(P, intercambiador(P), L).            % L = [cuatro_caminos, sol]
```

## Capturas

<img width="941" height="455" alt="image" src="https://github.com/user-attachments/assets/f3f790a7-5673-4a12-9b6c-735ba7bd3983" />
<img width="941" height="457" alt="image" src="https://github.com/user-attachments/assets/0cdddc2e-8574-474a-8f3b-765a1b9677d3" />

## Notas

- Quevedo, Legazpi y Villaverde Alto no aparecen en las listas de áreas del enunciado, así que se han incluido en el área B como "resto de paradas".
- `puede_viajar/3` comprueba la tarifa en la parada de origen y en la de destino.