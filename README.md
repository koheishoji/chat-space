# DATABASE DESIGNS

## users
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| name       | string      |              |
| email      | string      | unique       |

### ASSOCIATION
- has_many :messages
- has_many :user_groups

## groups
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| thread     | string      |              |

### ASSOCIATION
- has_many :messages
- has_many :user_groups

## messages
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| body       | text        |              |
| image      | string      | null         |
| user_id    | integer     |              |
| group_id   | integer     |              |

### ASSOCIATION
- belongs_to :user
- belongs_to :group

## user_groups
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| user_id    | integer     |              |
| groups_id  | integer     |              |

### ASSOCIATION
- belongs_to :user
- belongs_to :group
