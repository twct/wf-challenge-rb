# wf-challenge-rb

Implementing [wf-challenge](https://github.com/twct/wf-challenge) with Ruby

### Getting started with local development

**Install dependencies with Bundle**

```sh
$ bundle
```

**Setup the environment**

```sh
$ cp .env.example .env
```

Edit the `.env` file and supply the expected values

| Key                       | Example Value
| -------------------------- | ------------------------------------------------------------------------- |
| API_ENDPOINT               | https://some_api_host                                                     |

**Run the program**

```sh
$ ruby main.rb
```