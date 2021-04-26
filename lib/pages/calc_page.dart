import 'package:floor_calculator/controllers/calculator_controller.dart';
import 'package:floor_calculator/core/constants.dart';
import 'package:floor_calculator/widgets/header_text.dart';
import 'package:floor_calculator/widgets/number_input_field.dart';
import 'package:floor_calculator/widgets/primary_button.dart';
import 'package:floor_calculator/widgets/result_dialog.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formkey = GlobalKey<FormState>();
  final _controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetFields,
          )
        ],
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(kPadding),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: kMinimunSpace),
            HeaderText(label: kRoomHeader),
            SizedBox(height: kSpace),
            NumberInputField(
                label: "$kWidth ($kMeters)", onSaved: _controller.setRoomWidth),
            SizedBox(height: kMinimunSpace),
            NumberInputField(
                label: "$kLength ($kMeters)",
                onSaved: _controller.setRoomLength),
            SizedBox(height: kMaximunSpace),
            HeaderText(label: kFloorHeader),
            SizedBox(height: kSpace),
            NumberInputField(
                label: "$kWidth ($kMeters)",
                onSaved: _controller.setFloorWidth),
            SizedBox(height: kMinimunSpace),
            NumberInputField(
                label: "$kLength ($kMeters)",
                onSaved: _controller.setFloorLength),
            SizedBox(height: kSpace),
            NumberInputField(
                label: "$kPrice ($kReal)", onSaved: _controller.setFloorPrice),
            SizedBox(height: kMaximunSpace),
            PrimaryButton(
              label: kCalculate,
              onPressed: _onCalculate,
            )
          ],
        ),
      ),
    );
  }

  void _onCalculate() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      final result = _controller.calculate();
      ResultDialog.show(context, result);
    }
  }

  void resetFields() {
    _formkey.currentState.reset();
  }
}
