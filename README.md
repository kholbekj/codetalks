# Codetalks

This is the beginning of a project to collect code-related talks, rate, tag them, and so forth.

To contribute:

Fork and clone the repo, go to the folder, and then

  1. Create a development app on heroku, with the callback set to http://lvh.me:4000/auth/callback
  2. Copy the config/credentials.exs.example to config/credentials.exs, and fill in the blanks.
  3. Install dependencies with `mix deps.get`
  4. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  5. Start Phoenix endpoint with `mix phoenix.server`

Browse the site with lvh.me:4000

Create pullrequests against original with features/fixes

Basic main TODOS are:

 * Tags - Programming language / topic tags for talks.
 * Smarter embedding system
 * Automatic authentication and redirection on route subset
 * up-voting of talks
 * possible embedding of slides
 * all things frontend
 * demand less information from github
 * featured talks
 * a real submission / moderating system
 * your ideas!
