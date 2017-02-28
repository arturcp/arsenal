# Pagseguro

## Testing on the sandbox

To test the sandbox, go to [the sandbox url](sandbox.pagseguro.uol.com.br)

In your local machine you will need to use something like `ngrok` to configure the
NOTIFICATION_URL and the REDIRECT_URL, because the sandbox needs to reach your
urls.

To run ngrok:

```
/Applications/ngrok http 80
```

Copy the forwarding url it will print on the terminal and add them in your .env
file.


### fake buyer

In order to buy things on the sandbox you need to use a specific email/password. You
can find the information [in your account](https://sandbox.pagseguro.uol.com.br/comprador-de-testes.html)
