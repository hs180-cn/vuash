# Vuash

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
