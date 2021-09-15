
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rickandmorty/screens/auth/signup_otp.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _namecontroller = TextEditingController();

  
  final _formKey = GlobalKey<FormState>();



 
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Stack(alignment: Alignment.bottomCenter, children: <Widget>[
              Container(
                width: screenWidth * 1,
                height: screenHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/bg1.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                  //   border: Border.all(width: 1.0, color: const Color(0xff707070)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to!',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 24,
                              color: const Color(0xff2f2e41),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Text(
                            'The Rick and Morty , Signup to start',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 15,
                              color: const Color(0x992f2e41),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.phone,
                               inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                            ],
                         
                              validator: (value) {
                                if (value.length != 10) {
                                  return 'Phone Number should be of 10 digits';
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  // hintText: 'Enter your product description',
                                  labelStyle: TextStyle(
                                    fontFamily: 'Bell MT',
                                    fontSize: 15,
                                    color: const Color(0x992f2e41),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  labelText: 'Phone Number'),
                            ),
                          ),
   
                           SizedBox( height: screenHeight * 0.02,),
                           Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: _namecontroller,
                              
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Name';
                                } else
                                  return null;
                              },
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  labelStyle: TextStyle(
                                    fontFamily: 'Bell MT',
                                    fontSize: 15,
                                    color: const Color(0x992f2e41),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  labelText: 'Enter your Name'),
                            ),
                          ),
  
   
                           SizedBox( height: screenHeight * 0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 12,
                                    color: const Color(0xff8a9ead),
                                    letterSpacing: 0.30000000000000004,
                                    height: 1.5,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '                      \n',
                                    ),
                                    TextSpan(
                                      text: '        ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: const Color(0xff1d1a2f),
                                        letterSpacing: 0.4,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: 100.0,
                                height: 50.0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: const Color(0xd902020a),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xd93f3d56)),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_formKey.currentState.validate()) {
                                          // If the form is valid, display a Snackbar.
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                           //  BusinessInfo(widget.uid)
                                              Signupotp(
                                                  _controller.text,_namecontroller.text)
                                                 ));
                                              
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content:
                                                      Text('Sending OTP')));
                                        } else {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Invalid Phone Number')));
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'OTP',
                                            style: TextStyle(
                                              fontFamily: 'Bell MT',
                                              fontSize: 15,
                                              color: const Color(0xe5dde8f8),
                                              fontWeight: FontWeight.w700,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  width: screenWidth * 1,
                  height: screenHeight * 418 / 870,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: const Color(0xfff1f3f6),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x66000000),
                        offset: Offset(3, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              )
            ])
          ])),
        ),
      ),
    );
  }
}
