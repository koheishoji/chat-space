# DATABASE DESIGNS

## users
| column     | type        | option       |
|:----------:|:-----------:|:------------:|
| name       | string      |              |
| email      | string      | unique       |

### ASSOCIATION
- has_many :messages
- has_many :user_groups

## groups
| column     | type        | option       |
|:----------:|:-----------:|:------------:|
| thread     | string      |              |

### ASSOCIATION
- has_many :messages
- has_many :user_groups

## messages
| column     | type        | option       |
|:----------:|:-----------:|:------------:|
| body       | text        |              |
| image      | string      | null:true    |
| user_id    | integer     |              |
| group_id   | integer     |              |

### ASSOCIATION
- belongs_to :user
- belongs_to :group

## user_groups
| column     | type        | option       |
|:----------:|:-----------:|:------------:|
| user_id    | integer     |              |
| groups_id  | integer     |              |

### ASSOCIATION
- belongs_to :user
- belongs_to :group
