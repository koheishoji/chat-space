# ASSOCIATION

## users
- has_many :messages
- has_many :groups, through: :groups_users
- has_many :groups_users

## groups
- has_many :messages
- has_many :users, through: :groups_users
- has_many :groups_users

## messages
- belongs_to :user
- belongs_to :group

## groups_users
- belongs_to :user
- belongs_to :group

# DATABASE DESIGNS

## users
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| name       | string      | index:true       |
| email      | string      | unique:true      |

## groups
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| name       | string      |                  |

## messages
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| body       | text        | null:false       |
| image      | string      |                  |
| user_id    | integer     | foreign_key:true |
| group_id   | integer     | foreign_key:true |

## groups_users
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| user_id    | integer     | foreign_key:true |
| groups_id  | integer     | foreign_key:true |
