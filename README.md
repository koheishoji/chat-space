# DATABASE DESIGNS

## users
| column     | type        | option       |
|:----------:|:-----------:|:------------:|
| name       | string      | index:true   |
| email      | string      | unique:true  |

### ASSOCIATION
- has_many :messages
- has_many :groups, through: :user_groups

## groups
| column     | type        | option       |
|:----------:|:-----------:|:------------:|
| thread     | string      |              |

### ASSOCIATION
- has_many :messages
- has_many :users, through: :user_groups

## messages
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| body       | text        |                  |
| image      | string      |                  |
| user_id    | integer     | foreign_key:true |
| group_id   | integer     | foreign_key:true |

### ASSOCIATION
- belongs_to :user
- belongs_to :group

## user_groups
| column     | type        | option           |
|:----------:|:-----------:|:----------------:|
| user_id    | integer     | foreign_key:true |
| groups_id  | integer     | foreign_key:true |

### ASSOCIATION
- belongs_to :user
- belongs_to :group
