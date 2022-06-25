import 'package:template_package/template_package.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late Error sut;

  setUp(() {
    sut = BusinessError(message: "Error");
  });

   test('Test error', () {
       //Arrange
       final expected = 'Error';
       //Act
       final actual = sut.message;
       //Assert
       expect(actual, expected);
     });

}
