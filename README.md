# TwitterDevMood

The aim of this project is to analyze what people tweets about programming languages and frameworks.

- [Running Locally](#running-locally)
- [Deploying](#deploying)
- [API](#api)
- [Contributing](#contributing)

## Running locally:

  * Install dependencies with `mix deps.get && yarn`
  * Copy the env file with `cp .env.sample .env` and fill with your twitter keys
  * Create, migrate and seed your database with `mix ecto.setup`
  * Start the server with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Deploying

The project *as is* is ready to be deployed to your [heroku](https://www.heroku.com/) or [dokku](https://github.com/dokku/dokku) instance 😊.

## API

To get the stats:
`/api/languages`

You can also filter by tag:
`/api/languages?tag=android`

To get the list of available tags:
`/api/tags`

## Real time websocket

Subscribe to:
  endpoint: `/socket`
  room: `stats:languages`

Events:

  on `update`: Receive the updated stats (so far, only the total occurrences count is sent)
    ```json
    { "total_occurrences": 1234 }
    ```
