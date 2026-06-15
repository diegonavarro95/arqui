# Documentación del Proyecto: Sumador/Restador de 8 Bits con Convertidor Binario a BCD

## 1. Descripción General
Este proyecto implementa un sistema aritmético completo en un FPGA Lattice MachXO2. Integra un sumador/restador de 8 bits con un convertidor de binario a BCD (Binary Coded Decimal) para mostrar resultados en tres displays de 7 segmentos. El sistema maneja números signados en complemento a 2 y realiza la conversión automática a magnitud absoluta para la visualización.

## 2. Arquitectura del Sistema
El diseño es modular y jerárquico, basado en una unidad de procesamiento secuencial:

*   **Entidad Superior (`topconvbcd00`)**: Orquesta la comunicación entre el sumador, la unidad de control, los acumuladores y el sistema de visualización.
*   **Sumador/Restador (`adder8bitV00`)**: Realiza operaciones de suma y resta de 8 bits. Detecta desbordamientos (overflow) en el sistema de complemento a 2.
*   **Lógica de Magnitud**: Antes de la conversión BCD, si el resultado es negativo, el sistema aplica complemento a 2 para obtener el valor absoluto.
*   **Convertidor Binario a BCD**: Utiliza un algoritmo de desplazamientos y sumas (Double Dabble) controlado por una ROM de instrucciones (`leeInst00`) y un PC (`pcinc00`).
*   **Multiplexado de Displays**: Controlado por un anillo contador (`contring00`) y un multiplexor (`mux00`).

---

## 3. Mapeo de Pines (Pinout)

### A. Entradas de Datos (Dip Switches)
| Señal | Bits | Pines (MSB a LSB) | Función |
| :--- | :--- | :--- | :--- |
| **inport8a0** | 8 | 19, 20, 21, 22, 132, 133, 24, 23 | Vector de entrada A |
| **inport8b0** | 8 | 26, 25, 28, 27, 33, 32, 35, 34 | Vector de entrada B |

### B. Entradas de Control
| Pin | Señal | Función |
| :--- | :--- | :--- |
| **4** | **SL** | Selector de Operación: `0` = Suma, `1` = Resta. |
| **3** | **EN** | Habilitar/Ejecutar: Al subirlo, el resultado pasa al convertidor. |
| **2** | **reset0** | Reset General: Reinicia la lógica de control y acumuladores. |
| **1** | **reset1** | Reset de Reloj: Reinicia el divisor intermedio (detiene el sistema). |
| **9-14**| **cdiv0** | Selector de frecuencia para el divisor principal. |

### C. Salidas Visuales (LEDs)
| Pin | Señal | Función |
| :--- | :--- | :--- |
| **58** | **outLED0** | **Indicador de Desbordamiento**: Se enciende si hay overflow. |
| **91-97**| **outport8a0**| Monitor del Acumulador de 8 bits (Proceso binario). |
| **41-55**| **outport120**| Monitor del Acumulador de 12 bits (Resultado BCD en binario). |
| **59** | **sFlagInst** | Indica captura de instrucción válida. |
| **57** | **sFlag8out** | Indica fin de operación en acumulador de 8 bits. |
| **56** | **sFlag12out**| Indica fin de operación en acumulador de 12 bits. |
| **54** | **sFlag12B**  | Indica fin de una iteración interna. |

### D. Salidas de Displays (7 Segmentos)
| Pin | Señal | Función |
| :--- | :--- | :--- |
| **77-85**| **outDisplay**| Segmentos A-G del display. |
| **73-76**| **outTransist0**| Ánodos comunes (Selector de dígito). |

---

## 4. Funcionamiento de los Relojes
*   **Pin 61 (`clk0`)**: Reloj de alta velocidad para el multiplexado de los displays. Permite que los 3 dígitos parezcan encendidos simultáneamente.
*   **Pin 60 (`sclk0`)**: Reloj de procesamiento lento. Dicta la velocidad a la que la FSM (Máquina de Estados) ejecuta el algoritmo de conversión.

---

## 5. Lógica Especial Implementada

### Manejo de Números Negativos
Cuando se realiza una resta (ej. $64 - 65$), el resultado binario es `11111111` (-1). El sistema detecta el bit de signo y realiza lo siguiente:
1.  Invierte los bits: `00000000`.
2.  Suma 1: `00000001`.
3.  Envía el `1` al convertidor BCD para mostrarlo en los displays.

### Protección por Desbordamiento (Overflow)
Si el resultado de la suma/resta excede los límites de 8 bits signados (-128 a 127):
1.  Se enciende el LED en el **Pin 58**.
2.  La entrada al convertidor BCD se fuerza a **0**.
3.  Los displays mostrarán **0000**, indicando una operación inválida.

---
**Fecha de última modificación**: 21 de Mayo de 2026
**Proyecto**: Sumador-BCD Verilog Integration

## 6. Descripción de los Archivos Verilog

### A. Módulos de Alto Nivel y Control
*   **`topconvbcd00.v`**: Es la entidad superior (Top-Level). Conecta el sumador de 8 bits con el sistema de conversión BCD, gestiona la lógica de magnitud absoluta y el bloqueo por desbordamiento.
*   **`leeInst00.v`**: ROM de instrucciones. Contiene el microcódigo que dicta la secuencia de pasos (leer, desplazar, comparar, sumar) para el algoritmo Binario-BCD.
*   **`pcinc00.v`**: Contador de Programa (Program Counter). Incrementa las direcciones para leer la ROM de instrucciones de forma secuencial.
*   **`init00.v`**: Módulo de inicialización que pone en estado conocido los acumuladores y banderas al arrancar el sistema o tras un reset.

### B. Módulos de Aritmética (Sumador/Restador)
*   **`adder8bitV00.v`**: Sumador/Restador de 8 bits. Utiliza una cadena de sumadores completos y lógica XOR para realizar restas mediante complemento a 2. Incluye detección de overflow.
*   **`faV00.v`**: Sumador Completo (Full Adder) de 1 bit.
*   **`haV00.v`**: Medio Sumador (Half Adder) de 1 bit.
*   **Compuestas Básicas (`andV00.v`, `orV00.v`, `xorV00.v`, `xnorV00.v`)**: Implementaciones estructurales de compuertas lógicas utilizadas por el sumador.

### C. Módulos de Procesamiento BCD (Algoritmo Double Dabble)
*   **`ac8bit00.v` / `ac12bit00.v`**: Acumuladores de 8 y 12 bits respectivamente. Almacenan los datos intermedios durante los desplazamientos de la conversión.
*   **`shift8bit00.v` / `shift12bit00.v`**: Registros de desplazamiento que mueven los bits desde el registro binario hacia el registro BCD.
*   **`compadd00.v`**: Lógica central del algoritmo. Comprueba si un nibble (4 bits) es mayor o igual a 5 y, de ser así, le suma 3 antes del siguiente desplazamiento.
*   **`contIter00.v`**: Contador de iteraciones que asegura que el proceso de desplazamiento se repita exactamente 8 veces (una por cada bit del dato de entrada).
*   **`sust00.v`**: Módulo auxiliar para la transferencia de datos entre los acumuladores de 8 y 12 bits.

### D. Módulos de Visualización y Reloj
*   **`osc00.v`**: Instancia el oscilador interno del FPGA MachXO2.
*   **`div00.v`**: Divisor de frecuencia principal que reduce la velocidad del oscilador interno.
*   **`topdiv00.v`**: Encapsula el oscilador y el divisor para entregar el reloj rápido de los displays.
*   **`divint00.v`**: Segundo divisor que genera el reloj lento (`sclk0`) para la unidad de procesamiento.
*   **`contring00.v`**: Contador de anillo de 4 bits utilizado para activar secuencialmente los ánodos de los displays (multiplexado).
*   **`coderNibbles00.v`**: Decodificador que convierte los nibbles BCD en el código de 7 segmentos (A-G) para representar los números 0-9.
*   **`mux00.v`**: Multiplexor que selecciona cuál de los tres dígitos (unidades, decenas o centenas) se envía a los segmentos en cada ciclo del reloj de multiplexado.
*   **`portA00.v`**: Puerto de entrada que captura el dato binario (resultado del sumador) para iniciar el ciclo de conversión.
