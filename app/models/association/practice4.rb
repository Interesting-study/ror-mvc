=begin
1. 각 게시글은 여러 명의 댓글을 가질 수 있으며, 각 댓글은 하나의 게시글에만 속할 수 있습니다.
2. 각 게시글은 하나의 작성자만 가질 수 있습니다.
3. 각 댓글은 하나의 작성자만 가질 수 있습니다.
4. 각 작성자는 여러 개의 게시글과 댓글을 작성할 수 있습니다.
=end

class Member
  has_many :comments
  has_many :posts
end

class Post
  belongs_to :member
  has_many :comments, through: :post_comments
  has_many :post_comments
end

class Comment
  belongs_to :member
  has_many :posts, through: :post_comments
  has_many  :post_comments
end

class PostComment
  belongs_to :post
  belongs_to :comment
end