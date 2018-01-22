# encoding: UTF-8
require 'squib'
version  = 'v0.2'
Squib::Deck.new(cards: 20, layout: ['layout.yml']) do
  background color: :white
  rect layout: 'cut'
  rect layout: 'safe'
  data = csv file: 'Veganismo - Animais.csv'
  #rect layout: 'name'
  #rect layout: 'icon'
  #rect layout: 'value'
  fsize = data['Nome'].map do |name|
    case name.length
      when 0..7 then 18
      when 8..9 then 16
      when 10..12 then 14
      when 13..14 then 12
      when 15..50 then 10
    end
  end
  #dy = data['Num'].map do |n|
  #  case n
  #    when 0..9 then 18
  #    when 9..100 then 16
  #  end
  #end
  #text str: data['Nome'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'name',y: dy
  text str: data['Nome'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'name', font_size: fsize
  text str: data['Ambiente'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'environment'
  text str: data['Valor'], layout: 'value'
  text str: data['Desc'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'flavortext'

  #png layout: 
  png file:data['Espiral'].map!{|x| if x!=nil then 'imagens/icones/'+x end}, layout: 'icon'
  png file:data['Nome'].map!{|x| 'imagens/animais/'+x +'.png'}, layout: 'art'
  text str:version, layout: 'version'

  save_pdf file:'animais.pdf',width:'8.3 in',height: '11.7 in', margin: 0

end

Squib::Deck.new(cards: 29, layout: ['layout.yml']) do
  background color: :white
  rect layout: 'cut'
  rect layout: 'safe'
  data = csv file: 'Veganismo - Impactos.csv'
  #rect layout: 'name'
  #rect layout: 'icon'
  fsize = data['Nome'].map do |name|
    case name.length
      when 0..7 then 18
      when 8..9 then 16
      when 10..11 then 14
      when 12..14 then 13
      when 15..50 then 10
    end
  end
  text str: data['Nome'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'name', font_size: fsize
  #text str: data['Tipo'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'subtype'
  #text str: data['Valor'], layout: 'bonus1', font:'Arial bold 96'
  text str: data['Desc'].map!{|x| x.force_encoding(::Encoding::UTF_8)}, layout: 'effect'

  #png layout: 
  #rect layout: 'bonus1'
  #rect layout: 'bonus2'
  #rect layout: 'bonus3'
  text str:version, layout: 'version'
  png file:data['Estrela'].map!{|x| if x!=nil then 'imagens/icones/'+x end}, layout: 'icon'
  png file:data['Espiral'].map!{|x| if x!=nil then 'imagens/icones/'+x end}, layout: 'icon'
  png file:data['Equip'].map!{|x| if x!=nil then 'imagens/icones/'+x end}, layout: 'icon'
  png file:data['Img'].map!{|x| 'imagens/impactos/'+x.force_encoding(::Encoding::UTF_8) +'.png'}, layout: 'art'


  save_pdf file:'impactos.pdf',width:'8.3 in',height: '11.7 in', margin: 0

end