import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/demoController.dart';

class DemoPage extends StatelessWidget {
  DemoPage({super.key});
  final DemoController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(Get.arguments),
            ),
            SwitchListTile(
              value: ctrl.isDark,
              title: Text("Touch to change ThemeMode"),
              onChanged: ctrl.changeTheme,
            ),
            ElevatedButton(
                onPressed: () => Get.snackbar(
                    "Snackbar", "Hello this is the Snackbar message",
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.black87),
                child: Text('SnackBar')),
            ElevatedButton(
                onPressed: () => Get.defaultDialog(
                    title: "Dialouge", content: Text('Hey, from dialouge')),
                child: Text('Dialogue')),
            ElevatedButton(
                onPressed: () => Get.bottomSheet(Container(
                      height: 150,
                      color: Colors.white,
                      child: Text(
                        'Hello From Bottom sheet',
                        style: TextStyle(fontSize: 30),
                      ),
                    )),
                child: Text("Bottom Sheet")),
            ElevatedButton(
                onPressed: () => Get.offNamed('/'), child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
