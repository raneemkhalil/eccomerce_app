import 'package:flutter/material.dart';

class AddPaymentCardWidget extends StatelessWidget {
  const AddPaymentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -40,
            top: -40,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.close),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Card Number', style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.credit_card_outlined,
                          color: Colors.black38,
                        ),
                        hintText: 'Enter Card Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Card Holder Name', style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      cursorWidth: 300,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                          color: Colors.black38,
                        ),
                        hintText: 'Enter Holder Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Expired Date', style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.date_range,
                          color: Colors.black38,
                        ),
                        hintText: 'MM/YY',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('CVV Code', style: TextStyle(fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      cursorWidth: 300,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Colors.black38,
                        ),
                        hintText: 'CVV',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: SizedBox(
                        width: 240,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
                          ),
                          child: const Text(
                            'Add Card', 
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
