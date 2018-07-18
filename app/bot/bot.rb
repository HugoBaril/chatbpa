require 'facebook/messenger'
include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  command = message.get_command_for(bot)
  
  message.typing_on
  
  message.reply do |reply|
	case command
        when /Quels sont vos horaires d'ouverture ?/i
         reply.text = "Bonjour #{message.from.first_name}, nous sommes ouverts :
         - Sur BPA St Denis du lundi au vendredi de 8h à 17h et le samedi de 8h à 12h
         - Sur BPA St Paul du lundi au vendredi de 7h30 à 17h et le samedi de 8h à 12h
         - Sur BPA St Pierre et St André du lundi au vendredi de 7h30 à 12h puis de 13h30 à 17h, le samedi de 8h à 12h
         A bientôt !"
	    when /Où se trouvent les magasins ?/i
	    reply.text = "Bonjour #{message.from.first_name}, nos adresses sont :
         - BPA St Denis : 78 avenue Eudoxie Nonge (face à la Tour Cadjee)
         - BPA St Paul : Chaussée Royale (à côté du nouveau REP)
         - BPA St Pierre : Allée des Artisans (en face de Audio Plus en direction des 3 Brasseurs)
         - BPA St André : 337 chemin Lefaguyes 
         Au plaisir de vous accueillir !"
	    when /Demande d'informations/i
	    reply.text = "Bonjour #{message.from.first_name}, Pour toute demande de disponibilité ou de tarif produit, merci de nous préciser la pièce recherchée, le véhicule concerné ainsi que l’immatriculation de celui-ci afin de pouvoir répondre précisément à votre demande.
         Nous vous remercions et vous répondrons dans les plus brefs délais. "
    	when /Autre/i
	    reply.text = "Bonjour #{message.from.first_name}, quelle est votre demande ?"
         else
        message.typing_off
       
        end
    end
end

