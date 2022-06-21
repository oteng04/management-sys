import 'package:management_app/core/constants/color_constants.dart';

import 'package:management_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import 'form_widget.dart';



class FormsCard extends StatelessWidget {
  const FormsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            // ElevatedButton.icon(
            //   style: TextButton.styleFrom(
            //     backgroundColor: Colors.green,
            //     padding: EdgeInsets.symmetric(
            //       horizontal: defaultPadding * 1.5,
            //       vertical:
            //           defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.of(context).push(new MaterialPageRoute<Null>(
            //         builder: (BuildContext context) {
            //           return new FormMaterial();
            //         },
            //         fullscreenDialog: true));
            //   },
            //   icon: Icon(Icons.add),
            //   label: Text(
            //     "Add New",
            //   ),
            // ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: _FormCard(
            crossAxisCount: _size.width < 650 ? 1 : 2,
            childAspectRatio: _size.width < 650 ? 1.2 : 1,
          ),
          tablet: _FormCard(),
          desktop: _FormCard(
            childAspectRatio: _size.width < 1400 ? 1.2 : 1.4,
          ),
        ),
      ],
    );
  }
}


class _FormCard extends StatefulWidget {
  _FormCard({
    Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<_FormCard> with SingleTickerProviderStateMixin {



  final _formKey = GlobalKey<FormState>();
  TextEditingController? _controller;
  //String _initialValue;
  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = '';

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'circleValue',
      'label': '1ST Quarter',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.blue),
    },
    {
      'value': 'circleValue',
      'label': '2ND Quarter',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.blue),
    },
    {
      'value': 'circleValue',
      'label': '3RD Quarter',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.blue),
    },
    {
      'value': 'circleValue',
      'label': '4TH Quarter',
      'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.blue),
    },

  ];



  @override
  void initState() {
    super.initState();

    //_initialValue = 'starValue';
    _controller = TextEditingController(text: '2');

    _getValue();
  }


  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = 'circleValue';
        _controller?.text = 'circleValue';
      });
    });
  }
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.year,
        firstDate: DateTime(2000, 8),
        initialEntryMode: DatePickerEntryMode.input,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemBuilder: (context, index) =>
      index  == 0 ? FormsWidget(
        children: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Text('SECTION A: REPORTING YEAR',style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold,
             color: Colors.blue
           ),),
             SizedBox(height: 20),
             Text('FISCAL YEAR',style: TextStyle(
                 fontSize: 12,
                 fontWeight: FontWeight.bold,
             ),),
             SizedBox(height: 3),
             Row(
               children: [

                 RaisedButton(
                   onPressed: () => _selectDate(context),
                   child: Text('Select Year'),
                 ),
                 SizedBox(width: 20),
                 Text("${selectedDate.year}".split(' ')[0]),

               ],
             ),
            SizedBox(height: 20),

            SelectFormField(
              type: SelectFormFieldType.dialog,
              controller: _controller,
              //initialValue: _initialValue,
              icon: Icon(Icons.format_shapes),
              labelText: 'Reporting Quarter',
              changeIcon: true,
              dialogTitle: 'Pick a quarter',
              dialogCancelBtn: 'CANCEL',
              enableSearch: false,
              dialogSearchHint: 'Search item',
              items: _items,
              onChanged: (val) => setState(() => _valueChanged = val),
              validator: (val) {
                setState(() => _valueToValidate = val ?? '');
                return null;
              },

              onSaved: (val) => setState(() => _valueSaved = val ?? ''),
            ),
            SizedBox(height: 30),
            TextFormField(
              // controller: ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Label',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {   // Validation Logic
                  return 'Please enter fill in data';
                }
                return null;
              },
            ),
          ],
        ),
      ) : FormsWidget(
        children: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectFormField(
              type: SelectFormFieldType.dialog,
              controller: _controller,
              //initialValue: _initialValue,
              icon: Icon(Icons.format_shapes),
              labelText: 'Shape',
              changeIcon: true,
              dialogTitle: 'Pick a item',
              dialogCancelBtn: 'CANCEL',
              enableSearch: true,
              dialogSearchHint: 'Search item',
              items: _items,
              onChanged: (val) => setState(() => _valueChanged = val),
              validator: (val) {
                setState(() => _valueToValidate = val ?? '');
                return null;
              },
              onSaved: (val) => setState(() => _valueSaved = val ?? ''),
            ),
            SizedBox(height: 30),
            TextFormField(
              // controller: ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Label',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {   // Validation Logic
                  return 'Please enter fill in data';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
