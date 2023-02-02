const c_op = ['+', '-', 'x', '÷'];

class Calculator{
  static var _number =  [];
  static var _op =  [];

  static String _buffer;
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

  static String Execute(){
    int result;

    return result.toString();
  }
}