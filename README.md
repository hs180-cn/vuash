# Vuash

Vuash is a simple web app that lets you share plain text through a single access link.

We do not store keys in the database when the text is encrypted to ensure that we do not have access to it.


## How it works

1. Vuash receives text
2. Vuash encrypts text on the fly with a secret key
3. Vuash returns a link to access the text and discards the secret key
4. When text is accessed, Vuash destroys it
