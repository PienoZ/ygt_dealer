Config = {}

Config.Locale = 'tr'

--[[Config.Allrounditems = {
	james_fish = 15,
    copper = 5,
    iron = 10,
    gold = 30,
    diamond = 100,
    portakalsuyu = 30,
    honey_b = 15,
}]]

Config.Items = {
    {item = 'james_fish',label = 'Balık',price = 10},
    {item = 'copper',label = 'Bakır',price = 10},
    {item = 'iron',label = 'Demir',price = 10},
    {item = 'gold',label = 'Altın',price = 10},
    {item = 'diamond',label = 'Elmas',price = 10},
    {item = 'portakalsuyu',label = 'Portakal Suyu',price = 10},
    {item = 'honey_b',label = 'Süzme Bal',price = 10},


}


Config.Log = "false" -- Seçenekler: dc (Webhook gerektirir, discorda gönderir), console (server konsoluna printler), false (log tutmaz).

Config.CircleZones = {
	Allrounddealer = {coords = vector3(-265.61596679688, -962.90704345703, 30.223148345947), name = _U('blip_allrounddealer'), color = 2, sprite = 480, radius = 25.0}
}