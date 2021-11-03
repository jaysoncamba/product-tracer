document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('select');
  M.FormSelect.init(elems, {});
  
  elems.forEach(function (elem) {
    elem.onchange = function(e) {
      var target = e.currentTarget
      var input = document.getElementById(target.dataset.inputName)
      const selected = target.querySelectorAll('option:checked');
      const values = Array.from(selected).map(el => el.value);
      input.value = values
    }
  });
});
