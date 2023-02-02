const c_op = ['+', '-', 'x', '÷'];

class Calculator{
  static var _number =  [];
  static var _op =  [];

  static String _buffer = '';

  static void GetKey(String letter){
    // 四則演算子
    if(c_op.contains(letter)){
      _op.add(letter);
      _number.add(double.parse(_buffer));
      _buffer = '';
    } // C
    else if(letter == 'C'){
      _number.clear();
      _op.clear();
      _buffer = '';
    } // =
    else if(letter == '='){
      return null;
    } // number
    else{
      _buffer += letter;

    }
  }
  static double _result = 0;
  static Object Execute(){
    _number.add(double.parse(_buffer));

    if (_number.length == 0)
      return 0;

    _result = _number[0];
    //todo: process1: calculate only multiple and divide
    for (int i = 0; i < _op.length; i++) {
      if (_op[i] == '+')
        _result += _number[i + 1];
      else if (_op[i] == '-')
        _result -= _number[i + 1];
      else if (_op[i] == 'x')
        _result *= _number[i + 1];
      else if (_op[i] == '÷')
        _result /= _number[i + 1];
      else
        return 'e';
    }

    //todo: process2: calculate add and subtract

    _number.clear();
    _op.clear();
    _buffer = '';

    var resultStr = _result.toString().split('.');
    return resultStr[1] == '0' ? resultStr[0] : _result.toString();
  }
}