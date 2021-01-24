import 'package:flutter/material.dart';
import 'package:shader_mask_flutter/blend_mode_title.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var blendMode = BlendMode.modulate;

  List<Widget> blendModeButton(){
    List<Widget> buttonList = [];
    var raisedBtn;
    for(int i=0;i<blendModeTitle.length;i++){
      raisedBtn =  RaisedButton(
        onPressed: (){},
        child: Text(blendModeTitle[i],
        ),);
      buttonList.add(raisedBtn);
    }
    return buttonList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ShaderMask(
              blendMode: blendMode,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.red, Colors.black.withOpacity(0.8)])
                    .createShader(bounds);
              },
              child:Image.asset(
                'images/wolf.jpg',
                fit: BoxFit.cover,
              )
            ),
            Expanded(
              child: GridView.builder(
                padding:EdgeInsets.all(20),
                itemCount: blendModeTitle.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 40.0,
                  crossAxisCount: 3
                ),
                  itemBuilder: (context,index){
                    return RaisedButton(
                      child: Text(blendModeTitle[index]),
                        onPressed: (){
                          BlendMode blendModeEnum = BlendMode.values.firstWhere((e) => e.toString() == 'BlendMode.' + blendModeTitle[index]);
                          setState(() {
                            blendMode = blendModeEnum;
                        // print(blendModeType);
                       });
                    });

                  }),
            )

          ],
        ),
      ),
    );
  }
}


/*Expanded(
child: SingleChildScrollView(
child: Wrap(
spacing: 20,
runSpacing: 20,
children:blendModeButton()
),
),
)*/

/*RaisedButton(
child: Text(""),
onPressed: (){})*/
