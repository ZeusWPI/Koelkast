module.exports = (array, obj, n) ->
  Array.apply(null, new Array(n - array.length)).map (_) ->
    array.push obj
  array
