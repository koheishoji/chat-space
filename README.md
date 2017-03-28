# ASSOCIATION

## users
- has_many :messages
- has_many :groups, through: :user_groups

## groups
- has_many :messages
- has_many :users, through: :user_groups

## messages
- belongs_to :user
- belongs_to :group

## user_groups
- belongs_to :user
- belongs_to :groups

# DATABASE DESIGNS

## users
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| name       | string      | index:true       |
| email      | string      | unique:true      |

## groups
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| thread     | string      |                  |

## messages
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| body       | text        |                  |
| image      | string      |                  |
| user_id    | integer     | foreign_key:true |
| group_id   | integer     | foreign_key:true |

## user_groups
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| user_id    | integer     | foreign_key:true |
| groups_id  | integer     | foreign_key:true |
