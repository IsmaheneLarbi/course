while (1):
  try:
    taxes_pct = int(input("Quel est votre taux d'imposition ? : "))
    gains = int(input("Entrez votre salaire horaire net ? : "))
    
    gains_pct = 100 - taxes_pct
    price = (gains * 100) / gains_pct

    print(f'Vous devez facturer {round(price, 2)} euros de l\'heure')
    answer = input("Tappez 'Q' si vous souhaitez quitter, ou toute autre touche pour continuer : ")
    if answer.casefold() == 'q':
      break
  except ValueError:
    print("Vous devez entrer un nombre !")
