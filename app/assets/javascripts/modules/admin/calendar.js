define('calendar', [], function() {
  function Calendar(container) {
    this.container = $(container);

    this._bindEvents();
  };

  var fn = Calendar.prototype;

  fn._bindEvents = function() {
    this._openCalendar();
  };

  fn._openCalendar = function() {
    this.container.pickadate({
      selectMonths: true,
      selectYears: 5,
      monthsFull: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
      monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
      weekdaysFull: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
      weekdaysShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
      today: 'hoje',
      clear: 'limpar',
      close: 'fechar',
      format: 'yyyy-mm-dd',
      formatSubmit: 'yyyy-mm-dd'
    });
  };

  return Calendar;
});
