# Description:
#   Lookup user info from company directory
#
# Dependencies:
#   "fuzzaldrin": "^2.1.0"
#
# Commands:
#   hubot phone of <user query> - Return phone details for <user query>
#   hubot email of <user query> - Return email details for <user query>
#   hubot details of <user query> - Return all details for <user query>
#
# Author:
#   Angus Williams <angus@forest-technologies.co.uk>

{filter} = require 'fuzzaldrin'

# Define a list of users
directory = [
  {
    firstName: "John",
    lastName: "Lennon",
    fullName: "John Lennon",
    email: "johnl@example.com",
    phone: "+44 700 700 700"
  },
  {
    firstName: "Paul",
    lastName: "McCartney",
    fullName: "Paul McCartney",
    email: "paulm@example.com",
    phone: "+44 700 700 701"
  },
  {
    firstName: "George",
    lastName: "Harrison",
    fullName: "George Harrison",
    email: "georgeh@example.com",
    phone: "+44 700 700 703"
  },
  {
    firstName: "Ringo",
    lastName: "Starr",
    fullName: "Ringo Starr",
    email: "ringos@example.com",
    phone: "+44 700 700 704"
  }
]

module.exports = (robot) ->
  robot.respond /phone of ([\w .\-]+)\?*$/i, (res) ->
    # Get user query from capture group and remove whitespace
    query = res.match[1].trim()

    # Fuzzy search the directory list for the query
    results = filter(directory, query, key: 'fullName')

    # Reply with results
    res.send "Found #{results.length} results for query '#{query}'"
    for person in results
      res.send "#{person.fullName}: #{person.phone}"

  robot.respond /email of ([\w .\-]+)\?*$/i, (res) ->
    # Get user query from capture group and remove whitespace
    query = res.match[1].trim()

    # Fuzzy search the directory list for the query
    results = filter(directory, query, key: 'fullName')

    # Reply with results
    res.send "Found #{results.length} results for query '#{query}'"
    for person in results
      res.send "#{person.fullName}: #{person.email}"

  robot.respond /details of ([\w .\-]+)\?*$/i, (res) ->
    # Get user query from capture group and remove whitespace
    query = res.match[1].trim()

    # Fuzzy search the directory list for the query
    results = filter(directory, query, key: 'fullName')

    # Reply with results
    res.send "Found #{results.length} results for query '#{query}'"
    for person in results
      res.send "#{person.fullName}: #{person.email}, #{person.phone}"
