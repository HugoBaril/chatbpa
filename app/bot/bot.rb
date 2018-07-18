
require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
    if message.text.include? "Quels sont vos horaires d'ouverture ?"
       message.reply(text: "Bonjour #{message.from.first_name}, nous sommes ouverts :
         - Sur BPA St Denis du lundi au vendredi de 8h à 17h et le samedi de 8h à 12h
         - Sur BPA St Paul du lundi au vendredi de 7h30 à 17h et le samedi de 8h à 12h
         - Sur BPA St Pierre et St André du lundi au vendredi de 7h30 à 12h puis de 13h30 à 17h, le samedi de 8h à 12h
         A bientôt !") 
    elsif message.text.include? "Où se trouvent les magasins ?"
        message.reply(text: "Bonjour #{message.from.first_name}, nos adresses sont :
         - BPA St Denis : 78 avenue Eudoxie Nonge (face à la Tour Cadjee)
         - BPA St Paul : Chaussée Royale (à côté du nouveau REP)
         - BPA St Pierre : Allée des Artisans (en face de Audio Plus en direction des 3 Brasseurs)
         - BPA St André : 337 chemin Lefaguyes 
         Au plaisir de vous accueillir !")
	elsif message.text.include? "Demande d'informations"
        message.reply(text: "Bonjour #{message.from.first_name}, Pour toute demande de disponibilité ou de tarif produit, merci de nous préciser la pièce recherchée, le véhicule concerné ainsi que l’immatriculation de celui-ci afin de pouvoir répondre précisément à votre demande.
         Nous vous remercions et vous répondrons dans les plus brefs délais.") 
    else
        message.reply(text: "Bonjour #{message.from.first_name}, quelle est votre demande ?")
    end
  
end