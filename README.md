# Theme login Civadis for Keycloak
Visuel du login Civadis intégré dans Keycloak sous forme d'un theme compatible.
## Installation
Installer le répertoire `civadis/` dans le le repertoire theme de keycloak `keycloak/themes/civadis/`.
## Tester le projet
Installer Docker, ensuite jouer `docker-compose up`, cela va instancier une image keycloak avec le theme civadis préconfiguré, sur le port `8083`, vous pouvez donc ensuite tester sur : `http://localhost:8083`
## Installation sur projet local Docker
Pour sur votre environnement de développement, dans votre docker-compose, liez le volume afin qu'il point sur le theme civadis : 
    version: '2'
    services:
    keycloak:
    image: jboss/keycloak
    ports:
    - "8083:8080"
    environment:
    - "KEYCLOAK_USER=admin"
    - "KEYCLOAK_PASSWORD=admin"
    - "KEYCLOAK_WELCOME_THEME=civadis"
    volumes:
    - ./civadis/:/opt/jboss/keycloak/themes/civadis/
## Support
Equipe CSD