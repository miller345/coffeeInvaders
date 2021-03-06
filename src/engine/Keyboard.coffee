
class Keyboard

  keysDown: []

  startListening: (down, up, target = window.document) =>
    that = @
    target.addEventListener "keydown", (e) ->
      key = e.keyCode
      if (key is 32) or (key >= 37 and key <= 40) then e.preventDefault()
      if key not in that.keysDown #if not already pressed
        that.keysDown.push(key)
        down?(Keyboard.keys[key], key, e)

    target.addEventListener "keyup", (e) ->
      #e.preventDefault()
      key = e.keyCode
      index = that.keysDown.indexOf(key)
      if index > -1
        that.keysDown.splice(index, 1);
        up?(Keyboard.keys[key], key, e)


  @keys:
    8: 'backspace'
    9: 'tab'
    13: 'enter'
    16: 'shift'
    17: 'ctrl'
    18: 'alt'
    19: 'pause'
    20: 'caps_lock'
    27: 'esc'
    32: 'spacebar'
    33: 'page_up'
    34: 'page_down'
    35: 'end'
    36: 'home'
    37: 'left'
    38: 'up'
    39: 'right'
    40: 'down'
    44: 'print_screen'
    45: 'insert'
    46: 'delete'
    48: '0'
    49: '1'
    50: '2'
    51: '3'
    52: '4'
    53: '5'
    54: '6'
    55: '7'
    56: '8'
    57: '9'
    65: 'a'
    66: 'b'
    67: 'c'
    68: 'd'
    69: 'e'
    70: 'f'
    71: 'g'
    72: 'h'
    73: 'i'
    74: 'j'
    75: 'k'
    76: 'l'
    77: 'm'
    78: 'n'
    79: 'o'
    80: 'p'
    81: 'q'
    82: 'r'
    83: 's'
    84: 't'
    85: 'u'
    86: 'v'
    87: 'w'
    88: 'x'
    89: 'y'
    90: 'z'
    96: 'num_zero'
    97: 'num_one'
    98: 'num_two'
    99: 'num_three'
    100: 'num_four'
    101: 'num_five'
    102: 'num_six'
    103: 'num_seven'
    104: 'num_eight'
    105: 'num_nine'
    106: 'num_multiply'
    107: 'num_plus'
    109: 'num_minus'
    110: 'num_period'
    111: 'num_division'
    112: 'f1'
    113: 'f2'
    114: 'f3'
    115: 'f4'
    116: 'f5'
    117: 'f6'
    118: 'f7'
    119: 'f8'
    120: 'f9'
    121: 'f10'
    122: 'f11'
    123: 'f12'
    186: 'semicolon'
    187: 'plus'
    189: 'minus'
    192: 'grave_accent'
    222: 'single_quote'


module.exports = Keyboard
