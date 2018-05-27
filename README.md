![](https://cloud.githubusercontent.com/assets/62244/17832954/31b0879c-66e7-11e6-88e5-e9ed495007ab.png)

# Vuash

[![GitHub release](https://img.shields.io/github/release/current/vuash.svg)](https://github.com/current/vuash/releases/latest)

Vuash is a simple web app that lets you share plain text through a single access link.

All encryption is done by the browser, no secret keys touch the server, and only the encrypted message is stored in the database.


## How it works


### Sender side

1. Browser encrypts the message and generates a secret key
2. Browser discards unencrypted message
3. Browser passes secret key along via URL fragment (not contained in the request)
4. Server stores encrypted message in the database
5. Browser shows message link by concatenating the encrypted message's unique URL with the secret key


### Receiver side

1. Server sends encrypted message
2. Browser decrypts message with the secret key in the URL fragment
3. If key is valid, show contents
4. If key is invalid, show warning
5. Server destroys the message


## Hosted app

The app running at http://vua.sh is hosted on Heroku, with automatic deploys from this [master branch](https://github.com/current/vuash/tree/master/). Production code is always paired with this repository.


## Support the project

We currently pay for Vuash's domain from our own pocket. Please consider donating :balloon:

[![Buy Me a Coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/rmasoni)
