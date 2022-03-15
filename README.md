[![CircleCI](https://circleci.com/gh/arturcp/arsenal.svg?style=svg)](https://circleci.com/gh/arturcp/arsenal)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e271beab7a214c169bfac57d40fc6832)](https://www.codacy.com/app/arturcp/arsenal?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=arturcp/arsenal&amp;utm_campaign=Badge_Grade)

**Important** this project was discontinued.

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
