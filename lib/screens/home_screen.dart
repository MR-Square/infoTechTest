import 'package:flutter/material.dart';
import 'package:nimap_app/constants/api_handler.dart';
import 'package:nimap_app/models/record_model.dart';
import 'package:nimap_app/widgets/card_widget.dart';
import 'package:nimap_app/widgets/loader_widget.dart';

bool _isLoading = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RecordModel> recordsList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() {
      _isLoading = true;
    });

    recordsList = await ApiHandler().getRecords();

    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record List'),
      ),
      body: _isLoading
          ? const LoaderWidget()
          : SafeArea(
              child: ListView.builder(
                itemCount: recordsList.length,
                itemBuilder: (context, index) {
                  var record = recordsList[index];
                  return CardWidget(record: record);
                },
              ),
            ),
    );
  }
}
