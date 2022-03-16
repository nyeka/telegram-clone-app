import 'package:flutter/material.dart';
import '../main.dart';

String? name;
String? password;

class Sign extends StatefulWidget {
  const Sign({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;
  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  bool _submitted = false;
  var _text = '';
  final _controller = TextEditingController();
  final _control = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorText {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return 'Username can\'t be empty';
    }
    return null;
  }

  String? get _texterror {
    final script = _control.value.text;
    if (script.isEmpty) {
      return 'Password can\'t be empty';
    }
    return null;
  }

  void _submit() {
    setState(() {
      _submitted = true;
    });
    if (_errorText == null) {
      widget.onSubmit(_controller.value.text);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: (EdgeInsets.all(10)),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Please Login Before using our app',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ),
                          Flexible(
                            child: TextField(
                              controller: _controller,
                              autocorrect: true,
                              onSubmitted: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                              decoration: InputDecoration(
                                // icon:Icon(Icons.person),
                                border: OutlineInputBorder(),
                                hintText: 'Username',
                                errorText: _submitted ? _errorText : null,
                              ),
                              onChanged: (text) => setState(() => _text),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Flexible(
                            child: TextField(
                              controller: _control,
                              obscureText: true,
                              onSubmitted: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              decoration: InputDecoration(
                                errorText: _submitted ? _texterror : null,
                                // icon:Icon(Icons.person),
                                border: OutlineInputBorder(),
                                hintText: 'Password',
                              ),
                              onChanged: (text) => setState(() => _text),
                            ),
                          ),
                          Flexible(
                            child: ElevatedButton(
                                onPressed: _controller.value.text.isNotEmpty &&
                                        _control.value.text.isNotEmpty
                                    ? () {
                                        Navigator.of(context)
                                            .pushNamed(MyApp.welcome);
                                      }
                                    : _submit,
                                child: Text("Sign In")),
                          ),
                          Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Hit enter before login',
                                    textAlign: TextAlign.end,
                                  ))),
                          Text('Or Login Using'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Text('G'),
                                      ))),
                              Flexible(
                                  child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        child: Text('T'),
                                      ))),
                              Flexible(
                                  child: Container(
                                      child: FloatingActionButton(
                                onPressed: () {},
                                child: Text('F'),
                              ))),
                            ],
                          )
                        ],
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
