
class Error extends Entity<Error> {

  String category;
  String message;

  Error(this.category);

  /**
   * Displays (prints) an error.
   */
  display([String space='', bool withOid=true]) {
    print('${space}******************************************');
    print('${space}${category}                               ');
    print('${space}******************************************');
    if (withOid) {
      print('${space}oid: $oid');
    }
    if (code != null) {
      print('${space}code: $code');
    }
    print('${space}message: ${message}');
    print('${space}******************************************');
    print('');
  }

}

class Errors extends Entities<Error> {

  /**
   * Displays (prints) a title, then errors.
   */
   display([String title='Entities', bool withOid=true]) {
     if (title == 'Entities') {
       title = 'Errors';
     }
     print('');
     print('************************************************');
     print('$title                                          ');
     print('************************************************');
     print('');
     for (Error error in this) {
       error.display('*** ');
     }
   }

}



