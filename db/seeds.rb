# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.delete_all
Material.delete_all
Tag.delete_all
Favorite.delete_all


Recipe.create(recipe_id: '1', title: '卵焼き', explain: '卵を溶く。焼く。', is_browsable: 1, conversion_title: 'ﾀﾏｺﾞﾔｷ', user_id: '1')
Recipe.create(recipe_id: '2', title: '卵焼き', explain: '卵を溶く。焼く。', is_browsable: 1, conversion_title: 'ﾀﾏｺﾞﾔｷ', user_id: '1')
Recipe.create(recipe_id: '3', title: '卵焼き', explain: '卵を溶く。焼く。', is_browsable: 1, conversion_title: 'ﾀﾏｺﾞﾔｷ', user_id: '1')
Recipe.create(recipe_id: '4', title: '卵焼き', explain: '卵を溶く。焼く。', is_browsable: 1, conversion_title: 'ﾀﾏｺﾞﾔｷ', user_id: '1')
Material.create(material_id: '1', recipe_id: '1', nm_material: 'たまご', amnt_material: '2個', convert_material: 'ﾀﾏｺﾞ')
Material.create(material_id: '2',recipe_id: '1', nm_material: '顆粒だし', amnt_material: '小さじ 1/2', convert_material: 'ｶﾘｭｳﾀﾞｼﾞ')
Tag.create(tag_id: '1', nm_tag: '和食', recipe_id: '1')
Favorite.create(user_id: '2', recipe_id: '1')