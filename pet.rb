class Pet
  attr_accessor :condition, :fullnes, :mood, :hulkk, :skil
  def initialize
    @condition = condition #состояние
    @fullnes = fullnes #сытость
    @mood = mood #настроение
    @hulkk = hulkk #уровень тела
    @skil = skil # уровень авторитет
  end
  def feed
    @fullnes += 20
    ttime
  end
  def sleep
    @condition += 20
    ttime
  end
  def happy
    @mood += 20
    ttime
  end
  def hulk
    @hulkk += 20
    ttime
  end
  def skill
    @skil += 20
    ttime
  end
  private
  def ttime
    10.times do
      @mood -= 1
      @condition -= 1
      @fullnes -= 1
      @hulkk -= 1
      @skil -= 1
    end
  end
end