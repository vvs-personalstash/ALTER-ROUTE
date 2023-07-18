import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery=MediaQuery.of(context);
    double sheight = mediaQuery.size.height;
    double swidth = mediaQuery.size.width;
    print('$sheight $swidth');
    Color c1 = Color.fromRGBO(253, 182, 134, 1);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/back.jpeg'),fit: BoxFit.fill)
            ),
          ),
          Center(
            child: Material(
              color: Colors.white,
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: (25*swidth)/390,vertical: (20*sheight)/844),
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/images/icon2.png'),height: (100*sheight)/844,width: (100*swidth)/390,),
                      Row(children: [
                        Icon(Icons.person),
                        SizedBox(width: (10*swidth)/390,),
                        Flexible(child: TextFormField(decoration: InputDecoration(labelText: 'Email',hintText: 'Enter your email',),),)
                      ],),
                      SizedBox(height: (20*sheight)/844,),
                      Row(
                        children: [
                          Icon(Icons.lock),
                          SizedBox(width: (10*swidth)/390,),
                          Flexible(child: TextFormField(decoration: InputDecoration(labelText: 'Password',hintText: 'Enter your password',),obscureText: true,),),
                        ],
                      ),
                      SizedBox(height: (40/844)*sheight,),
                      Material(
                        elevation: 8,
                        color: c1,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/placesListScreen');
                          },
                          child: Container(
                            height: (45/844)*sheight,
                            width: (150/390)*swidth,
                            child: Center(child: Text('SignUp',style: TextStyle(color: Colors.white,fontSize: (18*sheight)/844,),),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                height: (370*sheight)/844,
                width: (300*swidth)/390,

              ),
            ),
          ),

        ],
      ),
    );
  }
}
