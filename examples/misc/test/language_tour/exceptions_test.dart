// ignore_for_file: assignment_to_final, unused_local_variable
import 'package:test/test.dart';

void main() {
  test('rethrow', () {
    // #docregion rethrow
    final foo = '';

    void misbehave() {
      try {
        foo = "You can't change a final variable's value.";
      } catch (e) {
        print('misbehave() partially handled ${e.runtimeType}.');
        rethrow; // Allow callers to see the exception.
      }
    }

    void main() {
      try {
        misbehave();
      } catch (e) {
        print('main() finished handling ${e.runtimeType}.');
      }
    }
    // #enddocregion rethrow

    expect(
        main,
        prints(allOf([
          contains('misbehave() partially handled'),
          contains('main() finished handling')
        ])));
  });
}
