define('collaborators', [], function() {
  function Collaborators() {
    this.button = $('[data-open-collaborators]');
    this.modal = $('#collaborators-modal').modal();

    this._bindEvents();
  };

  var fn = Collaborators.prototype;

  fn._bindEvents = function() {
    this.button.on('click', $.proxy(this._showCollaborators, this));
  };

  fn._showCollaborators = function() {
    this.modal.modal('open');
  };

  return Collaborators;
});
