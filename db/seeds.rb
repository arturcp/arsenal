User.create!(
  email: 'marco@arsenal.com.br',
  name: 'Marco',
  password: '12345678'
)

def description
  <<~HEREDOC
    Já parou para pensar que centenas de moradores de rua nunca celebraram o natal? Com a sua ajuda, este ano será diferente. Os moradores de rua de São Paulo terão um natal tão iluminado quanto o de cada um de nós.
    Árvores de natal serão espalhadas pelas ruas da cidade, e qualquer pessoa poderá deixar presentes debaixo da árvore dos moradores de rua mais próxima de sua residência.
    Vamos mostrar que existe espírito natalino dentro e fora das casas de todos os brasileiros.'
  HEREDOC
end

IMAGES = {
  christmas: 'http://trendytheme.net/demo/matrox/assets/img/banner/banner-7.jpg',
  bread: 'http://cdn1.mundodastribos.com/6370-receita-panetone-fazer-panetone-caseiro.jpg',
  wine: 'http://www.brechando.com/wp-content/uploads/2016/05/vinho.jpg',
  easter: 'http://blogs.gazetaonline.com.br/blogdastartup/wp-content/uploads/sites/13/2015/04/ovos-pascoa-coloridos-1.jpg',
  chocolate: 'http://ipiauonline.com.br/wp-content/uploads/2016/10/chocolate-e-bombom-bombons-2.jpg',
  construction: 'http://www.texturacorp.com/texturacorp/assets/Image/Blog%20-%20Bid%20Management/way%20to%20make%20construction%20business%20more%20profitable.jpg',
  paint: 'http://www.siote.com.br/blog/wp-content/uploads/2016/04/12.jpg'
}

CDN_IMAGES = {
  christmas: 'banner-7.jpg',
  bread: '6370-receita-panetone-fazer-panetone-caseiro.jpg',
  wine: 'vinho.jpg',
  easter: 'ovos-pascoa-coloridos-1.jpg',
  chocolate: 'chocolate-e-bombom-bombons-2.jpg',
  construction: 'construction.jpg',
  paint: 'paint.jpg'
}

# CDN = 'http://localhost:8000/'
CDN = nil

def image_for(key)
  CDN.present? ? URI::join(CDN, CDN_IMAGES[key]) : IMAGES[key]
end

christmas = Campaign.create!(
  name: 'Natal 2016',
  title: 'Natal nas ruas 2016',
  subtitle: 'Vamos mostrar que existe um espírito natalino',
  description: description,
  start_date: Date.parse('2016-11-01'),
  end_date: Date.parse('2016-12-25'),
  campaign_type: Campaign::TERMOMETER,
  main_image_url: image_for(:christmas),
  video_url: 'https://www.youtube.com/watch?v=EK_OqnXg71U',
  closing_text: 'Agradecemos de coração a todos que puderam nos ajudar a transformar esse sonho em realidade. Basta um pouco de cada um para que possamos construir um mundo melhor, e para isso nada melhor do que compartilharmos uma ceia de natal.'
)

christmas.items.create!(
  name: 'Panetone',
  description: 'O panetone é um alimento tradicional da época de Natal, de origem milanesa, do norte da Itália. Várias lendas tentam explicar a sua origem. O pão doce de natal possui fragrância discreta de baunilha e recheio de frutas secas, tais como damasco, laranja, limão, figo, maçã, cidra e a uva passa.',
  image_url: image_for(:bread),
  target: 300,
  price: 50.0,
  current_amount: 130
)

christmas.items.create!(
  name: 'Vinho',
  description: 'Vinho é, genericamente, uma bebida alcoólica produzida por fermentação do sumo de uva',
  image_url: image_for(:wine),
  target: 100,
  price: 70.0,
  current_amount: 40
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
  main_image_url: image_for(:easter),
  video_url: 'https://www.youtube.com/watch?v=2_W-jAuzUhY'
)

easter.items.create!(
  name: 'Chocolate',
  description: 'Páscoa não é páscoa sem chocolate!',
  image_url: image_for(:chocolate),
  target: 100,
  price: 20.0,
  current_amount: 5
)

construction = Campaign.create!(
  name: 'Reforma da capela',
  title: 'A capela não é apenas um templo de oração, mas um espaço para reunir as pessoas e criar laços',
  subtitle: 'Ajude-nos a reformá-la',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer commodo sodales purus, lacinia ultrices tortor hendrerit nec. Nunc vitae urna euismod, mattis diam sed, sagittis nisl. Duis finibus quis risus varius rutrum. Nulla dictum odio vel nisi consectetur condimentum. Sed mi nibh, elementum id turpis dictum, fringilla ultricies est. Sed euismod, dui ut fermentum convallis, odio ex mollis nunc, quis dapibus dolor arcu in magna. Nunc in augue vehicula, pulvinar sapien vestibulum, gravida enim. Sed sed aliquet massa, id accumsan nunc. Etiam egestas lorem vel elit euismod rutrum. Nullam congue porttitor purus, ut rutrum ante dictum eget. Morbi efficitur maximus lectus, nec pellentesque erat pretium viverra. Sed eget tempus sapien, vel rhoncus nunc. Nunc sed lorem viverra, rhoncus erat non, placerat neque. Integer ut orci vitae mauris pretium efficitur. Nunc sit amet lacus a leo volutpat bibendum ut ac sem.',
  start_date: Time.zone.now,
  end_date: 5.years.from_now,
  campaign_type: Campaign::CIRCULAR_PROGRESS,
  main_image_url: image_for(:construction),
  video_url: 'https://www.youtube.com/watch?v=rdl45XMmD1g',
  display: false
)

construction.items.create!(
  name: 'Tinta',
  description: 'Vamos pintar a parede externa da capela',
  image_url: image_for(:paint),
  target: 100,
  price: 5,
  current_amount: 0
)
