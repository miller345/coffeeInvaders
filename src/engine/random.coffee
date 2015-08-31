random =
  between: (min, max) ->
    return Math.floor(Math.random() * (max - min) + min)
  decide: (weight = 0.5, precission = 100) -> #weight is a decimal to 2dp, when precission =100
     val = random.between(0, precission)
     return val < weight * precission

module.exports = random
