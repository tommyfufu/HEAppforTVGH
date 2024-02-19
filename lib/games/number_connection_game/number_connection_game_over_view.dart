import 'package:flutter/material.dart';
import 'package:number_connection_test/games/number_connection_game/number_connection_game_ending_record_view.dart';
import 'package:number_connection_test/services/crud/models/UsersAndRecords.dart';
import 'package:number_connection_test/services/crud/services/crud_service_mysql.dart';

class NCGameOverView extends StatefulWidget {
  const NCGameOverView({super.key});

  @override
  State<NCGameOverView> createState() => _NCGameOverViewState();
}

class _NCGameOverViewState extends State<NCGameOverView> {
  late final Services _services;

  @override
  void initState() {
    _services = Services();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('遊戲紀錄'),
      ),
      extendBodyBehindAppBar: false,
      body: StreamBuilder<List<DatabaseRecord>>(
        stream: _services.allRecords,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle error
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final latestRecord = snapshot.data!.last;
            return NCEndingRecordView(record: latestRecord);
          } else {
            // Handle the case where there's no data
            return const Center(child: Text('No records found.'));
          }
        },
      ),
    );
  }
}