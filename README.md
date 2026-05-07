# MATLAB Live Script for Analyzing Full-Wave Uncontrolled Rectifiers

Proyecto desarrollado en MATLAB/Simulink para analizar el comportamiento de un **rectificador trifásico de onda completa no controlado** con carga **resistiva-inductiva (RL)**. El repositorio incluye Live Scripts, scripts auxiliares y un modelo de Simulink para estudiar formas de onda, corriente de salida, voltajes de fase/línea y distorsión armónica total (THD).

## Descripción general

Un rectificador trifásico no controlado utiliza un puente de seis diodos para convertir una señal de corriente alterna trifásica en una salida de corriente continua pulsante. Este tipo de circuito es común en sistemas industriales, fuentes de alimentación DC, cargadores de baterías y alimentación de motores.

El proyecto permite modificar parámetros eléctricos de entrada y observar cómo afectan la respuesta del sistema, especialmente en una carga RL.

## Objetivo

Analizar, simular y visualizar el funcionamiento de un rectificador trifásico de onda completa no controlado mediante herramientas de MATLAB y Simulink.

El proyecto busca:

- Estudiar el comportamiento de un puente rectificador trifásico con seis diodos.
- Evaluar señales de voltaje y corriente en diferentes puntos del circuito.
- Analizar la corriente de salida sobre una carga RL.
- Calcular o visualizar parámetros asociados a la respuesta del rectificador.
- Comparar resultados teóricos con simulaciones realizadas en Simulink.
- Facilitar el análisis mediante Live Scripts interactivos.

## Tecnologías utilizadas

- MATLAB
- MATLAB Live Script (`.mlx`)
- Simulink
- Simscape Electrical / Specialized Power Systems
- Cálculo simbólico en MATLAB
- Análisis de formas de onda eléctricas
- Simulación de rectificadores trifásicos

## Estructura del proyecto

```txt
liverectificador+thd/
├── Interfaz RL OC TRI PARCIAL.mlx
├── livescript-FINALnei.mlx
├── Rectificador_RL.slx
├── iout.m
└── mediaondacontrolado.m
```

## Archivos principales

### `livescript-FINALnei.mlx`

Live Script principal del proyecto. Presenta la explicación teórica y el análisis del rectificador trifásico no controlado con carga RL.

Incluye:

- Introducción al rectificador trifásico de onda completa.
- Explicación del puente de seis diodos.
- Ingreso de parámetros eléctricos.
- Visualización de señales.
- Análisis de resultados.
- Gráficas asociadas al comportamiento del circuito.

Parámetros de ejemplo utilizados en el Live Script:

```txt
Vp = 170 V
R = 10 ohm
L = 0.01 H
f = 60 Hz
```

### `Interfaz RL OC TRI PARCIAL.mlx`

Live Script complementario orientado a una interfaz o versión parcial del análisis. Permite evaluar dinámicamente parámetros de entrada y visualizar señales relacionadas con el rectificador.

Incluye análisis de:

- Voltajes de fase.
- Voltajes de línea.
- Corriente de salida.
- Relación entre corriente de salida y corriente de fase.
- Comparación de voltajes de salida.

### `Rectificador_RL.slx`

Modelo de Simulink para la simulación del rectificador trifásico con carga RL.

El modelo contiene elementos como:

- Tres fuentes de voltaje AC.
- Seis diodos de potencia.
- Rama RLC en serie.
- Mediciones de voltaje.
- Mediciones de corriente.
- Bloques Scope para visualización.
- Bloque `powergui`.
- Bloque de análisis THD.

Este archivo permite validar gráficamente el comportamiento del rectificador y observar señales eléctricas directamente desde Simulink.

### `iout.m`

Script de MATLAB para calcular y graficar la corriente de salida del rectificador.

Solicita al usuario parámetros como:

```txt
vp
R
L
frecuencia
E
alpha
```

A partir de estos valores calcula:

- Frecuencia angular.
- Impedancia de la carga.
- Ángulo de desfase por inductancia.
- Relación entre la fuente DC y el voltaje pico.
- Expresión de la corriente de salida.

También genera gráficas de la corriente considerando desfases entre señales.

### `mediaondacontrolado.m`

Script utilizado para analizar condiciones de conducción y valores mínimos de corriente. Evalúa el comportamiento de la corriente para diferentes ángulos y busca una condición cercana a un valor mínimo deseado.

El script calcula:

- Impedancia equivalente.
- Ángulo de desfase.
- Corriente mínima.
- Ángulo donde se alcanza la corriente mínima.
- Valor de alpha asociado.

## Requisitos

Para ejecutar correctamente este proyecto se recomienda contar con:

- MATLAB instalado.
- Simulink instalado.
- Simscape Electrical o librerías equivalentes de sistemas eléctricos.
- Symbolic Math Toolbox para las operaciones simbólicas usadas en algunos scripts.

## Cómo ejecutar el proyecto

1. Clonar el repositorio:

```bash
git clone URL_DEL_REPOSITORIO
```

2. Abrir MATLAB.

3. Ir a la carpeta del proyecto:

```matlab
cd 'liverectificador+thd'
```

4. Abrir el Live Script principal:

```matlab
open('livescript-FINALnei.mlx')
```

5. Ejecutar las secciones del Live Script en orden.

6. Para abrir el modelo de Simulink:

```matlab
open_system('Rectificador_RL.slx')
```

7. Ejecutar la simulación desde Simulink y observar las señales en los bloques Scope.

## Ejecución de scripts auxiliares

Para ejecutar el cálculo de corriente de salida:

```matlab
iout
```

El programa solicitará los parámetros de entrada desde la consola de MATLAB.

Para ejecutar el análisis de corriente mínima:

```matlab
mediaondacontrolado
```

## Parámetros analizados

El proyecto permite estudiar variables como:

- Voltaje pico de entrada.
- Resistencia de carga.
- Inductancia de carga.
- Frecuencia de la fuente.
- Corriente de salida.
- Ángulo de desfase.
- Voltajes de fase.
- Voltajes de línea.
- THD.
- Comportamiento de conducción en el puente de diodos.

## Resultados esperados

Al ejecutar el proyecto se pueden obtener:

- Gráficas de voltajes trifásicos.
- Gráficas de voltajes de línea.
- Corriente de salida sobre carga RL.
- Visualización del comportamiento del puente rectificador.
- Comparación entre análisis matemático y simulación.
- Estimación de condiciones de conducción.
- Análisis de distorsión armónica total.

## Aplicaciones

Este tipo de análisis es útil en áreas como:

- Electrónica de potencia.
- Sistemas de conversión AC/DC.
- Fuentes de alimentación industriales.
- Accionamientos eléctricos.
- Cargadores de baterías.
- Sistemas de potencia trifásicos.
- Laboratorios de máquinas eléctricas y conversión de energía.

## Aprendizajes del proyecto

Durante el desarrollo de este proyecto se refuerzan conceptos como:

- Funcionamiento de rectificadores trifásicos no controlados.
- Uso de diodos en electrónica de potencia.
- Análisis de cargas RL.
- Modelado de circuitos eléctricos en Simulink.
- Uso de MATLAB Live Scripts para documentación técnica.
- Cálculo de formas de onda y corriente de salida.
- Interpretación de señales eléctricas en sistemas trifásicos.
- Análisis de THD en sistemas de potencia.

## Posibles mejoras

- Agregar una interfaz más completa para ingresar parámetros.
- Exportar automáticamente resultados y gráficas.
- Comparar rectificadores monofásicos y trifásicos.
- Incluir análisis para carga R, RL y RLE.
- Agregar más documentación sobre las ecuaciones utilizadas.
- Añadir capturas del modelo de Simulink y resultados obtenidos.
- Incluir validación experimental con mediciones reales.
- Crear una versión del análisis para rectificadores controlados con SCR.

## Nota de seguridad

Este proyecto está orientado a simulación y análisis académico. Si se implementa físicamente un rectificador trifásico, se deben tomar precauciones adecuadas, ya que este tipo de circuito puede trabajar con niveles de voltaje y corriente peligrosos.

## Autor

Desarrollado como proyecto académico para el análisis de rectificadores trifásicos de onda completa no controlados usando MATLAB y Simulink.
