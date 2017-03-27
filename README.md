# DATABASE

## DATABASE DESIGNS

### users
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| id         | integer     | auto         |
| name       | char        |              |
| email      | char        |              |
| u_g_id     | integer     |              |

### groups
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| id         | integer     | auto         |
| thread     | char        |              |
| u_g_id     | integer     |              |

### messages
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| id         | integer     | auto         |
| body       | text        |              |
| image      | string      | null         |
| user_id    | integer     |              |
| group_id   | integer     |              |

### user_groups
| column     | type        | default      |
|:----------:|:-----------:|:------------:|
| id         | integer     | auto         |
| user_id    | integer     |              |
| groups_id  | integer     |              |

** u_g_id = user_groups_id **

## ASSOCIATION
'''
class User
  has_many :messages
  has_many :user_groups
end

class Group
  has_many :user_groups
end

class Message
  belongs_to :user
  belongs_to :group
end

class User_groups
  belongs_to :user
  belongs_to :group
end
'''
