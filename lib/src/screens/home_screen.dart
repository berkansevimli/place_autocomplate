import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_autocomplete/app_bar_widget.dart';
import 'package:place_autocomplete/src/blocs/application_bloc.dart';
import 'package:place_autocomplete/src/screens/selected_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: (applicationBloc.currentLocation == null)
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Please check the Location Permissions!",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : applicationBloc.errorMessage == null
              ? ListView(
                  children: [
                    Divider(
                      color: Colors.black54,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Search Location...',
                              prefixIcon: Icon(Icons.location_on),
                              suffixIcon: Icon(Icons.search)),
                          onChanged: (value) =>
                              applicationBloc.searchPlaces(value),
                        ),
                      ),
                    ),
                    Stack(children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemCount: applicationBloc.searchResult != null
                                    ? applicationBloc.searchResult!.length
                                    : 0,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        border: new Border(
                                            bottom: new BorderSide(
                                                color: Colors.black54,
                                                width: 0.2))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8.0, top: 8.0),
                                      child: ListTile(
                                        leading: Icon(Icons.location_on),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SelectedPage(
                                                          description:
                                                              applicationBloc
                                                                  .searchResult![
                                                                      index]
                                                                  .placeId)));
                                        },
                                        title: Text(
                                          applicationBloc.searchResult != null
                                              ? applicationBloc
                                                  .searchResult![index]
                                                  .description
                                              : '',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          applicationBloc.searchResult != null
                                              ? applicationBloc
                                                  .searchResult![index].adress
                                              : '',
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ],
                )
              : Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(
                        applicationBloc.errorMessage.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                      leading: Icon(Icons.error),
                      trailing: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          applicationBloc.setMessage(null);
                        },
                      ),
                    ),
                  ),
                ),
    );
  }
}
