class Author
    attr_accessor :name, :posts
  
    @@post_count = 0

    def initialize(name)
      @name = name
      @posts = []
    end
  
    def posts
      Post.all.select {|post| post.author == self}
    end

    def add_post(post)
        @@post_count += 1
        @posts << post #has many
        post.author = self #belong to
    end

    def add_post_by_title(title)
        title = Post.new(title)
        self.add_post(title)
    end

    def self.post_count
       Post.all.count 
    end
 
end