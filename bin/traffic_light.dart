import 'package:traffic_light/traffic_light.dart' as traffic_light;
import 'dart:io';
import 'dart:async';

enum Light { green, yellow, red }

void main() {
  // traffic(Light.green);
  // traffic(Light.yellow);
  // traffic(Light.red);
  traffic(Light.green);
}

traffic(Light light) async {
  int green_timer_count = 20;
  int yellow_timer_count = 5;
  int red_timer_count = 10;
  Timer.periodic(Duration(seconds: 1), (timer) {
    switch (light) {
      case Light.green:
        print(green_timer_count - timer.tick);

        if ((green_timer_count) - timer.tick <= 3) {
          print('Скоро загориться желтый!');
        }
        if ((green_timer_count) - timer.tick == 1) {
          timer.cancel();
          print('\nГорит желтый');
          traffic(Light.yellow);
        }

        break;
      case Light.yellow:
        print(yellow_timer_count - timer.tick);

        if ((yellow_timer_count) - timer.tick <= 3) {
          print('Скоро загориться красный!');
        }
        if ((yellow_timer_count) - timer.tick == 1) {
          timer.cancel();
          print('\nГорит красный');
          traffic(Light.red);
        }

        break;

      case Light.red:
        print(red_timer_count - timer.tick);

        if ((red_timer_count) - timer.tick <= 3) {
          print('Скоро загориться зеленый!');
        }
        if ((red_timer_count) - timer.tick == 1) {
          timer.cancel();
          print('\nГорит зеленый');
          traffic(Light.green);
        }
        
        break;
      default:
    }
  });
}
