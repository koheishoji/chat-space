# DATABASE DESIGNS

** u_g_id = user_groups_id **

## users
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| id         | integer     | auto         |
| name       | char        |              |
| email      | char        |              |
| u_g_id     | integer     |              |

### ASSOCIATION
- has_many :messages
- has_many :user_groups

## groups
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| id         | integer     | auto         |
| thread     | char        |              |
| u_g_id     | integer     |              |

### ASSOCIATION
- has_many :user_groups

## messages
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| id         | integer     | auto         |
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
| id         | integer     | auto         |
| user_id    | integer     |              |
| groups_id  | integer     |              |

### ASSOCIATION
- belongs_to :user
- belongs_to :group
