# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.create!(
  team_name: "アストロズ",
  id: 1,
)
Team.create!(
  team_name: "ブルース",
  id: 2,
)

Team.create!(
  team_name: "カーズ",
  id: 3,
)

Team.create!(
  team_name: "フォース",
  id: 4
)

Team.create!(
  team_name: "デイズ",
  id: 5,
)

Team.create!(
  team_name: "エース",
  id: 6,
)

 email: "#{n + 1}@a",
    nick_name: "eaa#{n + 1}",
    team_id: 2,
    first_name: "吉田#{n + 1}",
    first_name_kana:"よしだ#{n + 1}",
    last_name: "翔吾#{n + 1}",
    last_name_kana: "しょうご#{n + 1}",
    password: "aaaaaa",
    id: "#{n + 1}",
  )
end