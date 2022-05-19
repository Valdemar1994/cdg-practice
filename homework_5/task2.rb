module Resource
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        verb = gets.chomp
                    
        break if verb == 'q'

        if ['GET','POST','PUT','DELETE'].include?(verb)
  
          action = nil
  
          if verb == 'GET'
            print 'Choose action (index/show) / q to exit: '
            action = gets.chomp
            break if action == 'q'
          end
    
          action.nil? ? routes[verb].call : routes[verb][action].call

        else
          puts 'ERROR! Type correct verb to interact with resources (GET/POST/PUT/DELETE)'
        end
      end
    end
  end
  
  class PostsController
    extend Resource
  
    def initialize
      @posts = []
    end
  
    def index
      @posts.each_with_index do |post, index|
        puts "#{index}: #{post}"
      end
    end

    def show
      print 'Type post identificator:'
      id = gets.to_i
      @posts.each_with_index do |post, index|
        puts "Selected post: #{post}" if id == index
      end
    end
  
    def create
      print 'Type text what you want add in your post: '
      text = gets.chomp
      @posts.push(text)
      @posts.each_with_index do |post, index|
      end
      puts 'Success! Post created!'
    end
  
    def update
      print 'Type post identificator:'
        id = gets.to_i 
        print 'Type text what you want update in your post: '
        text = gets.chomp
        result = []
        @posts.each_with_index do |post, index|
          result.push(id == index ? text : post)
          @posts = result
      end
      puts 'Success! Update accepted!'
    end
  
    def destroy
      print 'Type id post what you want delete:'
      id = gets.to_i
      @posts.delete_at(id)
      puts 'Success! Post deleted!'
    end
  end

  class Router
    def initialize
      @routes = {}
    end
  
    def init
      resources(PostsController, 'posts')
  
      loop do
        print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
        choise = gets.chomp
  
        PostsController.connection(@routes['posts']) if choise == '1'
        break if choise == 'q'
      end
  
      puts 'Good bye!'
    end
  
    def resources(klass, keyword)
      controller = klass.new
      @routes[keyword] = {
        'GET' => {
          'index' => controller.method(:index),
          'show' => controller.method(:show)
        },
        'POST' => controller.method(:create),
        'PUT' => controller.method(:update),
        'DELETE' => controller.method(:destroy)
        }
      end
  end
  
  router = Router.new
  
  router.init