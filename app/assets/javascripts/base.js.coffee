$ ->
  ################
  # data-xeditable
  ################

  # Настройки по умолчанию:
  $.fn.editable.defaults.disabled = true

  # Кнопка включения редактирвоания:
  $("#editable_on_of").click ->
    $(".editable").editable "toggleDisabled"

  # Отправка запроов:
  $("[data-xeditable=true]").each ->
    $(@).editable
      ajaxOptions:
        type: "PUT"
        dataType: "json"
      params: (params) ->
        railsParams = {}
        railsParams[$(@).data("model")] = {}
        railsParams[$(@).data("model")][params.name] = params.value
        return railsParams
      select2:
        tags: $(@).data("tags") #['sdghsdh', 'sdhsdh']
        tokenSeparators: [",", " "]
        multiple: true