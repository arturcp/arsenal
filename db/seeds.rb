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
  main_image_url: 'http://trendytheme.net/demo/matrox/assets/img/banner/banner-7.jpg',
  video_url: 'https://www.youtube.com/watch?v=EK_OqnXg71U'
)

christmas.items.create!(
  name: 'Panetone',
  description: 'O panetone é um alimento tradicional da época de Natal, de origem milanesa, do norte da Itália. Várias lendas tentam explicar a sua origem. O pão doce de natal possui fragrância discreta de baunilha e recheio de frutas secas, tais como damasco, laranja, limão, figo, maçã, cidra e a uva passa.',
  image_url: 'http://cdn1.mundodastribos.com/6370-receita-panetone-fazer-panetone-caseiro.jpg',
  target: 300,
  price: 50.0,
  current_amount: 130
)

christmas.items.create!(
  name: 'Vinho',
  description: 'Vinho é, genericamente, uma bebida alcoólica produzida por fermentação do sumo de uva',
  image_url: 'http://www.brechando.com/wp-content/uploads/2016/05/vinho.jpg',
  target: 100,
  price: 70.0,
  current_amount: 40
)
