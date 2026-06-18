# BiblioIA: Sistema de Gestión de Biblioteca con Agente de Inteligencia Artificial

Este repositorio contiene el desarrollo del **Trabajo Práctico Integrador** para la cátedra **Base de Datos** (3º año - Ingeniería en Sistemas de Información) de la **Universidad Tecnológica Nacional, Facultad Regional Concepción del Uruguay (UTN FRCU)**.

El proyecto consiste en el diseño e implementación de **BiblioIA**, un sistema de gestión de biblioteca relacional robusto en MySQL combinado con un agente de Inteligencia Artificial desarrollado en Python (Jupyter Notebook). El agente es capaz de traducir lenguaje natural a consultas SQL (Text-to-SQL) y ofrecer recomendaciones personalizadas de lectura basadas en el historial de los socios.

---

## 📋 Requisitos Previos y Descargas


Antes de comenzar, es necesario instalar y configurar las siguientes herramientas en tu sistema local:

1. **MySQL Server (Versión 8.0 o superior)**
   * Descarga el instalador oficial desde [MySQL Downloads](https://dev.mysql.com/downloads/installer/).
   * Durante la instalación, configura el puerto por defecto `3306` y establece una contraseña segura para el usuario `root` (la necesitarás luego para configurar las variables de entorno).

2. **Python (Versión 3.10 o superior)**
   * Descarga el instalador oficial desde [Python.org](https://www.python.org/downloads/).
   * **Importante:** En Windows, asegúrate de activar la casilla **"Add Python to PATH"** antes de iniciar la instalación.

3. **DBeaver Community Edition**
   * Descarga e instala la herramienta gráfica desde [DBeaver.io](https://dbeaver.io/download/).

4. **Visual Studio Code (o tu editor de preferencia)**
   * Descarga desde [code.visualstudio.com](https://code.visualstudio.com/).

---

## 🛠️ Instalación y Configuración Paso a Paso

### 1. Clonar el Repositorio
Abre tu terminal, navega hasta la carpeta donde desees guardar el proyecto y clona el repositorio:
```bash
git clone https://github.com/marioacaballero/tpfinalDB.git
```


### 2. Configuración de la Base de Datos en DBeaver
Para montar la estructura y lógica del sistema, abre DBeaver, crea una nueva conexión a tu servidor MySQL utilizando usuario y contraseña, y ejecuta de manera estricta y secuencial los siguientes scripts alojados en el directorio sql:

01_ddl_schema.sql: Crea la base de datos y la estructura de las tablas.

02_dml_datos.sql: Realiza la carga inicial de datos ficticios (socios, libros, préstamos).

03_procedures.sql: Registra los procedimientos almacenados para las operaciones lógicas de la biblioteca.

04_triggers.sql: Configura los disparadores automáticos para auditoría y control de stock.

05_vistas.sql: Genera las vistas del sistema. Nota: Siempre que sea posible para la posterior consulta del Agente de IA, se priorizará el uso de estas vistas para abstraer la complejidad del modelo relacional.

### 3. Configuración del Archivo de Entorno (.env)
El agente de IA necesita conocer las credenciales de acceso a la base de datos y los tokens de los servicios de IA.

Abre la carpeta del proyecto en Visual Studio Code.

Crea un archivo en el directorio notebooks del proyecto llamado exactamente .env.

Copia, pega y completa la siguiente estructura con tus datos:

```
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=TU_CONTRASEÑA_DE_MYSQL
DB_NAME=nombre_de_la_base_de_datos
DB_PORT=3306
```

#### API Key de Groq Cloud
⚠️ Nota previa: Si no tienes una clave de API para Groq, debes ingresar a Groq Cloud Console, crearte una cuenta gratuita, generar una nueva API Key en la sección API Keys y pegarla en la variable correspondiente.

### 4. Instalar Dependencias y Jupyter Notebook
Asegúrate de contar con pip actualizado e instala el entorno de ejecución junto con las librerías necesarias ejecutando en la terminal:

```Bash
pip install notebook
```

### 5. Ejecutar el Agente de IA
Para levantar el servidor local de Jupyter y comenzar a interactuar con el agente Text-to-SQL, ejecuta:
```
Bash
jupyter notebook
```
Si el comando anterior no se inicia de forma automática en tu navegador, puedes probar con:
```
Bash
python -m notebook
```

### 6. Ejecutar el Agente de IA
En la interfaz gráfica de Jupyter que se abrió en tu navegador, navega hasta el Proyecto y abre la carpeta llamada notebook.

Haz clic en el archivo BiblioIA.ipynb para abrir el cuaderno de trabajo.

Ejecuta el archivo celda por celda de manera secuencial (puedes usar el botón Run o el atajo Shift + Enter).

Importante: Espera a que cada celda termine su ejecución por completo (el indicador [*] debe cambiar a un número como [1], [2], etc.) antes de continuar con la siguiente. Esto asegura que el agente inicialice correctamente la conexión a la base de datos y los modelos de lenguaje.

### 7. Probar las Consultas (Queries)
Con el agente ya inicializado y corriendo, regresa al árbol de archivos de Jupyter y abre el archivo test_queries.ipynb.

Desde este notebook podrás interactuar directamente con el sistema, enviar peticiones en lenguaje natural y verificar cómo el Agente Text-to-SQL las traduce y las ejecuta sobre la base de datos relacional.
