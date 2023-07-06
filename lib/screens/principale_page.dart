import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PrincipalePage extends StatefulWidget {
  const PrincipalePage({Key? key}) : super(key: key);
  @override
  State<PrincipalePage> createState() => _PrincipalePageState();
}
class _PrincipalePageState extends State<PrincipalePage> {
  @override
  Widget build(BuildContext context) {
    //début de l'interface d'application avec appBar
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 81, 244)
,
          title: Text("Masante"),
        ),
//corps ou contenu de l'application avec un SingleChildScrollView pour le rendre scrollable
        body: SingleChildScrollView(
          child: Column(
            children: [
              searchSection(),
              boxSection(),
              //singlescroll(),
              lineSection(),
              subTitleSection,
              bottomSection()
            ],
          ),
        ),
      ),
    );
  }
  
  bottomSection() {}
  
  lineSection() {}
  
  boxSection() {}
  
  searchSection() {}
  
  DrawerMenu() {}

}



Widget iconSection = Container(
  padding: EdgeInsets.all(10),
  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child:const Icon(
                Icons.new_releases,
                color: Colors.white,
                size: 30,
              ),
            ),
          const  SizedBox(height: 5),
            Text('Reste')
          ],
        ),
      ),
    ],
  ),
);

Widget subTitleSection = Container(
  margin: EdgeInsets.all(20),
  child: Row(
    children: [
      Container(
        color:const Color.fromARGB(255, 6, 81, 244),
        width: 5,
        height: 25,
      ),
    const  SizedBox(width: 10),
     const Text(
        'patients récents',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  ),
);