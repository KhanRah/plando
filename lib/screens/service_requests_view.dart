import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plando/bloc/list_view_bloc.dart';
import 'package:plando/modals/service_requests_modal.dart';
import 'package:plando/utilities/app_colors.dart';
import 'package:plando/utilities/formFields.dart';
import 'package:plando/utilities/util_screens.dart';


class ServiceRequestsView extends StatefulWidget {
  const ServiceRequestsView({Key? key}) : super(key: key);

  @override
  _ServiceRequestsViewState createState() => _ServiceRequestsViewState();
}

class _ServiceRequestsViewState extends State<ServiceRequestsView> {


  late ServiceRequestsBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = ServiceRequestsBloc();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0),
        child: Column(
          children: [
            ShowException(key: const Key("Employee"),stream: _bloc.streamException,),
            Expanded(child: StreamBuilder(
              stream: _bloc.streamRequests,
              builder: (BuildContext context,AsyncSnapshot<List<ServiceRequests>> snapshot){
              if(snapshot.connectionState == ConnectionState.active && snapshot.hasData)
                {
                  _bloc.filteredSearch.sink.add(snapshot.data);
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FormFields.getFormFieldWithIcon(
                            icon: const Icon(Icons.search_sharp),
                            readOnly: false,
                            formFieldController: _bloc.searchPeople,
                            maxLines: 1,
                            hintText: "Search",
                            context: context,
                            obscureText: false,
                            onChanged: (val) {
                              _bloc.searchMember(val, snapshot.data);
                            }),
                      ),
                      StreamBuilder(
                          stream: _bloc.streamFiltered,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<ServiceRequests>?>
                              snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active &&
                                snapshot.hasData &&
                                snapshot.data!.length != 0) {
                              return Expanded(
                                child: ListView(
                                  children: List.generate(snapshot.data!.length, (index) => RequestCard(snapshot.data![index])),
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.active &&
                                snapshot.hasData &&
                                snapshot.data!.length == 0) {
                              return const Center(
                                  child: Text("No search results. Please try another"));
                            } else {
                              return const Center(
                                  child: CupertinoActivityIndicator());
                            }
                          }),
                    ],
                  );
                }
              else
                {
                  return const CupertinoActivityIndicator();
                }
            },))
          ],
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final ServiceRequests serviceRequest;
  const RequestCard(this.serviceRequest, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(serviceRequest.imageFile!)),
          title: Text("${serviceRequest.title}",style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 18.0),),
          subtitle: Text("${serviceRequest.description}"),
        ),
      ),
    );
  }
}


