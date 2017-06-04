def image_path(name, extension)
  Rails.root.join('db/seed-images', "#{name.to_s}.#{extension}").to_s
end

def image_for(image, extension = 'jpg')
  path = image_path(image, extension)
  File.open(path, 'rb')
end

admin = User.create!(
  email: 'admin@arsenal.com.br',
  name: 'Admin',
  password: ENV.fetch('ADMIN_PASSWORD'),
  avatar_url: image_for(:admin_avatar)
)

marco = User.create!(
  email: 'marco@arsenal.com.br',
  name: 'Marco',
  password: ENV.fetch('ADMIN_PASSWORD'),
  avatar_url: image_for(:marco_avatar, 'png')
)

def description
  <<~HEREDOC
    Já parou para pensar que centenas de moradores de rua nunca celebraram o natal? Com a sua ajuda, este ano será diferente. Os moradores de rua de São Paulo terão um natal tão iluminado quanto o de cada um de nós.
    Árvores de natal serão espalhadas pelas ruas da cidade, e qualquer pessoa poderá deixar presentes debaixo da árvore dos moradores de rua mais próxima de sua residência.
    Vamos mostrar que existe espírito natalino dentro e fora das casas de todos os brasileiros.'
  HEREDOC
end

christmas = Campaign.create!(
  name: 'Natal 2016',
  title: 'Natal nas ruas 2016',
  subtitle: 'Vamos mostrar que existe um espírito natalino',
  description: description,
  start_date: Date.parse('2016-11-01'),
  end_date: Date.parse('2016-12-25'),
  campaign_type: Campaign::TERMOMETER,
  video_url: 'https://www.youtube.com/watch?v=EK_OqnXg71U',
  closing_text: 'Agradecemos de coração a todos que puderam nos ajudar a transformar esse sonho em realidade. Basta um pouco de cada um para que possamos construir um mundo melhor, e para isso nada melhor do que compartilharmos uma ceia de natal.',
  main_image_url: image_for(:christmas)
)

item = christmas.items.create!(
  name: 'Panetone',
  description: 'O panetone é um alimento tradicional da época de Natal, de origem milanesa, do norte da Itália. Várias lendas tentam explicar a sua origem. O pão doce de natal possui fragrância discreta de baunilha e recheio de frutas secas, tais como damasco, laranja, limão, figo, maçã, cidra e a uva passa.',
  target: 300,
  price: 50.0,
  current_amount: 130,
  image_url: image_for(:bread)
)

item = christmas.items.create!(
  name: 'Vinho',
  description: 'Vinho é, genericamente, uma bebida alcoólica produzida por fermentação do sumo de uva',
  target: 100,
  price: 70.0,
  current_amount: 40,
  image_url: image_for(:wine)
)

christmas.campaign_news.create(text: 'Compartilhem com seus amigos, ajude a campanha a atingir o maior número de pessoas possíveis.', link: 'http://www.facebook.com', link_text: 'Compartilhe')
christmas.campaign_news.create(text: 'Conseguimos o suficiente para acolhermos 25 pessoas!')

easter = Campaign.create!(
  name: 'Páscoa 2017',
  title: 'Páscoa 2017',
  subtitle: 'Vamos celebrar juntos',
  description: 'Páscoa ou Domingo da Ressurreição[1][2] é uma festividade religiosa e um feriado que celebra a ressurreição de Jesus ocorrida três dias depois da sua crucificação no Calvário, conforme o relato do Novo Testamento[3][4]. É a principal celebração do ano litúrgico cristão e também a mais antiga e importante festa cristã. A data da Páscoa determina todas as demais datas das festas móveis cristãs, exceto as relacionadas ao Advento[3]. O domingo de Páscoa marca o ápice da Paixão de Cristo e é precedido pela Quaresma, um período de quarenta dias de jejum, orações e penitências.',
  start_date: 100.years.ago,
  end_date: 100.years.from_now,
  campaign_type: Campaign::CIRCULAR_PROGRESS,
  video_url: 'https://www.youtube.com/watch?v=2_W-jAuzUhY',
  main_image_url: image_for(:easter)
)

item = easter.items.create!(
  name: 'Chocolate',
  description: 'Páscoa não é páscoa sem chocolate!',
  target: 100,
  price: 20.0,
  current_amount: 5,
  image_url: image_for(:chocolate)
)

construction = Campaign.create!(
  name: 'Reforma da capela',
  title: 'A capela não é apenas um templo de oração, mas um espaço para reunir as pessoas e criar laços',
  subtitle: 'Ajude-nos a reformá-la',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer commodo sodales purus, lacinia ultrices tortor hendrerit nec. Nunc vitae urna euismod, mattis diam sed, sagittis nisl. Duis finibus quis risus varius rutrum. Nulla dictum odio vel nisi consectetur condimentum. Sed mi nibh, elementum id turpis dictum, fringilla ultricies est. Sed euismod, dui ut fermentum convallis, odio ex mollis nunc, quis dapibus dolor arcu in magna. Nunc in augue vehicula, pulvinar sapien vestibulum, gravida enim. Sed sed aliquet massa, id accumsan nunc. Etiam egestas lorem vel elit euismod rutrum. Nullam congue porttitor purus, ut rutrum ante dictum eget. Morbi efficitur maximus lectus, nec pellentesque erat pretium viverra. Sed eget tempus sapien, vel rhoncus nunc. Nunc sed lorem viverra, rhoncus erat non, placerat neque. Integer ut orci vitae mauris pretium efficitur. Nunc sit amet lacus a leo volutpat bibendum ut ac sem.',
  start_date: Time.zone.now,
  end_date: 5.years.from_now,
  campaign_type: Campaign::CIRCULAR_PROGRESS,
  video_url: 'https://www.youtube.com/watch?v=rdl45XMmD1g',
  display: false,
  main_image_url: image_for(:construction)
)

item = construction.items.create!(
  name: 'Tinta',
  description: 'Vamos pintar a parede externa da capela',
  target: 100,
  price: 5,
  current_amount: 0,
  image_url: image_for(:paint)
)

article = Article.create!(
  title: 'Inauguração',
  description: 'Este é um momento único para nós aqui do Arsenal. Vamos ajudar quem precisa! Nos próximos dias daremos início a algumas campanhas de arrecadação que são muito importantes para manter nosso trabalho',
  body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sed fringilla risus. Curabitur sit amet laoreet ligula, tempor rutrum justo. Vivamus gravida tincidunt nunc, sed egestas nunc iaculis nec. Nullam eget nulla nec arcu viverra tincidunt. Nunc tempor a augue nec iaculis. Morbi mollis efficitur enim et elementum. Nunc commodo imperdiet tellus vel imperdiet. Etiam et accumsan neque. Donec suscipit et nisl ac laoreet.
  Nullam facilisis augue vitae velit fringilla, nec tempor orci gravida. In pretium porttitor quam eget placerat. Phasellus quis suscipit magna. Sed pharetra magna id sollicitudin gravida. Aenean pulvinar ornare scelerisque. Duis a tincidunt purus, sed mollis ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
  Curabitur iaculis risus at blandit scelerisque. Sed pharetra justo quis eleifend elementum. Duis pretium lectus non commodo venenatis. Nulla vitae enim mauris. Curabitur hendrerit tortor sagittis tellus pellentesque dictum. Nulla accumsan ultricies dolor, id tempor orci mollis ac. Nunc eleifend, mi sit amet vulputate pretium, arcu lacus tincidunt quam, non mollis diam mi id turpis. In et felis eget elit vehicula aliquet et aliquet nulla. Nam nec finibus quam, ac egestas libero.
  Maecenas blandit facilisis tempus. Sed non lacinia enim. Etiam vitae metus tincidunt, sollicitudin nisi non, ultrices risus. Mauris volutpat dolor nulla, id malesuada nulla ultrices non. Morbi pharetra justo nec sagittis luctus. Duis luctus ac est et tristique. Praesent efficitur sem ac dui euismod luctus. Ut interdum hendrerit dui, in vulputate diam imperdiet eu.
  Proin aliquet ligula fringilla tortor condimentum dignissim. Proin ut dui non lorem lobortis iaculis. Nam non egestas justo. Aliquam erat volutpat. In tincidunt tellus quis lacinia gravida. Quisque tincidunt porttitor erat, vel dignissim est mollis vel. Nullam vitae enim nec ex tempus efficitur. Integer quis sapien pulvinar, efficitur justo in, iaculis tellus. Phasellus id varius arcu. Aliquam eget velit quis velit elementum consectetur eu eu risus. Cras laoreet fringilla lacus a dignissim. Quisque cursus nisl purus, eu interdum elit faucibus quis. Proin egestas turpis erat, in efficitur augue viverra in. Nunc lacinia faucibus nisi, ac tristique massa auctor a. Praesent sed dui quam.',
  main_image_url: image_for(:article)
)

CampaignMessage.create!(
  campaign_id: easter.id,
  author: 'John Doe',
  email: 'john.doe@gmail.com',
  message: 'Fico muito feliz de poder participar dessa iniciativa.',
  status: 1
)

CampaignMessage.create!(
  campaign_id: easter.id,
  author: 'Mary Roe',
  email: 'mary.doe@gmail.com',
  message: 'Espero que minha contribuição possa fazer a diferença para vocês.'
)

CampaignMessage.create!(
  campaign_id: easter.id,
  author: 'Edgar Allan Poe',
  email: 'unknown@uol.com.br',
  message: 'Não quero falar nada aqui',
  status: 0
)
