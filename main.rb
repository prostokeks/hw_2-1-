require_relative "./pet.rb"

puts "Тамагочи"
puts
puts "Выберите питомца (впишите номер):
1. Курица
2. Кот
3. Собака
4. Медведь
5. Хомяк
6. Ввести свой вариант"
a = STDIN.gets.chomp.to_i

case a
when 1
  pet = "Курица"
when 2
  pet = "Кот"
when 3
  pet = "Собака"
when 4
  pet = "Медведь"
when 5
  pet = "Хомяк"
when 6
  puts "Введите свой вариант"
  pet = STDIN.gets.chomp
end

puts "Назовите своего питомца:"
pet_name = STDIN.gets.chomp
puts "Поприветствуем Нашего питомца:

Вид: #{pet}
Кличка: #{pet_name}"

fullnes = 100 #показатель сытости
condition = 100 #показатель состояния
mood = 100 # показатель настроения
hulkk = 100
skil = 100
hom = Pet.new
hom.condition = condition
hom.mood = mood
hom.fullnes = fullnes
hom.hulkk = hulkk
hom.skil = skil


puts
puts "Базовые показатели питомца:

Сытость: #{hom.fullnes}
Состояние: #{hom.condition}
Настроение: #{hom.mood}
Накаченость: #{hom.hulkk}
Авторитет: #{hom.skil}

Да начнется игра"
puts
puts "Выберите действие:
1. Покормить
2. Уложить спать
3. Играть
4. Гулять
5. Подкачаться
6. Авторитет
7. Инструкция
8. Выйти"



loop do

  case hom.mood
  when (0..29)
    mood_name = "Убить готов"
  when (30..99)
    mood_name = "Ну такое"
  when (100..159)
    mood_name = "Норм"
  when (160..180)
    mood_name = "Дай зацелую"
  end
  case hom.fullnes
  when (0..29)
    fullnes_name = "Голодный"
  when (30..99)
    fullnes_name = "Пожевал бы"
  when (100..159)
    fullnes_name = "Не голодный"
  when (160..180)
    fullnes_name = "Щас лопну"
  end

  case hom.condition
  when (0..29)
    condition_name = "Вырубаюсь"
  when (30..99)
    condition_name = "Поспал бы"
  when (100..159)
    condition_name = "Норм"
  when (160..180)
    condition_name = "Вот это я выспаный"
  end
  case hom.hulkk
  when (0..29)
    hulkk_name = "Дрыщь"
  when (30..99)
    hulkk_name = "Для начала покатит"
  when (100..159)
    hulkk_name = "Норм"
  when (160..180)
    hulkk_name = "Боженька"
  end
  case hom.skil
  when (0..29)
    skil_name = "Дрыщь"
  when (30..99)
    skil_name = "Для начала покатит"
  when (100..159)
    skil_name = "Норм"
  when (160..180)
    skil_name = "Боженька"
  end
  action = STDIN.gets.chomp.to_i

  case action
  when 1
    puts "Вы кормите #{pet_name}"
    hom.feed
    break puts "#{pet} #{pet_name} - Лопнул" if hom.fullnes >180
    puts "#{pet} покушал, показатель сытости: #{fullnes_name}"
  when 2
    puts "Вы укладуете спать #{pet_name}"
    hom.sleep
    break puts "#{pet} #{pet_name} - Впал в кому" if hom.condition >180
    puts "#{pet} спит, показатель сна: #{condition_name}"
  when 3
    puts "Вы играете с #{pet_name}"
    hom.happy
    break puts "#{pet} #{pet_name} - Скончался из-за переизбытка ендорфина" if hom.mood >180
    puts "#{pet} играет, показатель щастя: #{mood_name}"
  when 4
    puts "Вы выгуливаете #{pet_name}"
    hom.happy
    break puts "#{pet} #{pet_name} - Скончался из-за переизбытка ендорфина" if hom.mood >180
    puts "#{pet} гуляет, показатель щастя: #{mood_name}"
  when 5
    puts "Вы повели в тренажерку #{pet_name}"
    hom.hulk
    break puts "#{pet} #{pet_name} говорит: Теперь ты называй меня Хозяин" if hom.hulkk >180
    puts "#{pet} позанимался, показатель формы: #{hulkk_name}"
  when 6
    puts "Вы повели на повишение квалификации #{pet_name}"
    hom.skill
    break puts "Вы вступили в банду #{pet} #{pet_name}" if hom.skil >180
    puts "#{pet} позанимался, показатель авторитета: #{skil_name}"
  when 7
    a = IO.read("rules.txt")
    puts a
  when 8
    break
  end

  break puts "#{pet} #{pet_name} - Убили" if hom.skil <=0
  break puts "#{pet} #{pet_name} - Умер со стыда" if hom.hulkk <=0
  break puts "#{pet} #{pet_name} - Нассал в тапки" if hom.mood <=0
  break puts "#{pet} #{pet_name} - Сьел хозяина" if hom.fullnes <=0
  break puts "#{pet} #{pet_name} - Умер" if hom.condition <=0

  puts "#{pet_name} говорит: Вырубаюсь" if hom.condition <=30
  puts "#{pet_name} говорит: Голодный" if hom.fullnes <=30
  puts "#{pet_name} говорит: Убить готов" if hom.mood <=30
  puts "#{pet_name} говорит: Ото я Дрыщь" if hom.hulkk <=30
  puts "#{pet_name} говорит: Нужно чет делать" if hom.skil <=30

end
