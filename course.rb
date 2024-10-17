# frozen_string_literal: true

# this class' responsibility is to return info on a course.
# its price, the amount of taxes paid on it, the amount gained from it.
class Course
  attr_reader :net_price, :taxes_pct, :net_price_pct

  def initialize(net_price, taxes_pct)
    @net_price = net_price
    @taxes_pct = taxes_pct
    @net_price_pct = net_price_pctage
  end

  def to_s
    "Tu gagnes #{net_price} euros nets de l'heure et paies #{taxes_pct} % d'impôts."
  end

  def full_price
    (net_price * 100 / net_price_pct).round(2)
  end

  private

  def net_price_pctage
    100 - taxes_pct
  end
end

quit = false
until quit
  begin
    puts 'Quel est ton salaire horaire net ? : '
    net_price = Float(gets.chomp)
    puts "Quel est ton taux d'imposition ? : "
    taxes_pct = Float(gets.chomp)
    if Integer(taxes_pct) == 100
      puts "Le taux d'imposition ne peut pas être égal à 100%!\n"
      puts "On recommence!"
      next
    end

    course = Course.new(net_price, taxes_pct)
    puts "Tu dois facturer #{course.full_price} euros/heure.\n"
    puts "Tappe 'Q' si tu souhaites quitter, ou toute autre touche pour continuer : "
    quit = gets.chomp.downcase == 'q'
  rescue ArgumentError => e
    puts e.message
  end
end
