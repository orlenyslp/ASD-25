# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Takso.Repo.insert!(%Takso.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Takso.{Repo, Accounts.User, Sales.Taxi}

[
  %{name: "Dio Brando", age: 120, username: "DIO", password: "itsmedio"},
  %{name: "Jotaro Kujo", age: 17, username: "JoJo", password: "oraoraora"}
]
|> Enum.map(fn user_data -> User.changeset(%User{}, user_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)

[
  %{username: "Giorno", location: "Liivi 8", status: "available"},
  %{username: "Jonathan", location: "Kompanii 10", status: "available"},
  %{username: "Joseph", location: "Narva mnt 18", status: "available"},
  %{username: "Kakyoin", location: "Kompanii 123", status: "available"},
  %{username: "Jolyne", location: "Riia 2", status: "busy"}
]
|> Enum.map(fn taxi_data -> Taxi.changeset(%Taxi{}, taxi_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)
