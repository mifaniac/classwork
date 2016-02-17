class Developer
  attr_accessor :dev_name
  MAX_TASKS = 10

  def initialize(dev_name)
    @dev_name = dev_name
    @task_list = []
    @work_done = "выполнена задача"
  end

  def add_task(task_name)
    if @task_list.count >= MAX_TASKS
      raise(ArgumentError,"Слишком много работы!") 
    else
      @task_list.push(task_name)
      puts "#{@dev_name}: добавлена задача \"#{task_name}\". Всего в списке задач: #{@task_list.count}"
    end
  end

  def tasks
    @task_list.each_with_index {|task, index| puts "#{index+1}. #{task}"}
  end

  def work!
    if @task_list.count <= 0
       raise(ArgumentError,"Нечего делать!")
    else
      @task_list.shift
      puts "#{@dev_name}: #{@work_done} \"#{@task_list[0]}\". Осталось задач: #{@task_list.count}"
    end
  end

  def status
    return "свободен" if @task_list.count.zero?
    return "занят" if @task_list.count == MAX_TASKS
    return "работаю"
    
  end

  def can_add_task?
    @task_list.count < MAX_TASKS ? true : false
  end

  def can_work?
    @task_list.count > 0 ? true : false
  end
end

class JuniorDeveloper < Developer
  attr_accessor :dev_name

  MAX_TASKS = 5

  def initialize(dev_name)
    @work_done = "пытаюсь делать задачу"
    super
  end

  def add_task(task_name)
    raise(ArgumentError,"Слишком сложно!") if task_name.length > 20
    super
  end
end

class SeniorDeveloper < Developer
  
  MAX_TASKS = 15

  def work!
    good_mood = [true, false][rand(0..1)]
    if good_mood 
      @task_list.shift(2)
    else
      puts "Что-то лень"
    end
  end
end

a = JuniorDeveloper.new("Вася")
b = SeniorDeveloper.new("Петя")
c = Developer.new("Jack")


b.status

