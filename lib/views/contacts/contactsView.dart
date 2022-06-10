import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/contacts/cubits/cubits.dart';
import 'package:jumiaa/views/contacts/states/states.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';



class ContactsView extends StatefulWidget {

  @override
  _ContactsViewState createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> {
  // Future<void>? _launched;
  // String _phone = '';
  // static const String toLaunch = 'https://www.cylog.org/headers/';
  //
  // Future<void> _launchInBrowser(String url) async {
  //

  // }
  // String url ="https://www.youtube.com/results?search_query=how+to+get+url+in+postman+";
  // Future<void> _makePhoneCall(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xcd157f80),
        elevation: 0.0,
        title: Center(child: Text("About Us")),
      ),
      body: BlocBuilder<ContactsController , ContactsStates>(
        builder: (context, state) => state is ContactsLoading ? Text('Loading') : ListView.builder(
          itemCount: ContactsController.of(context).contactsModel!.data!.data!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>
              CustomButtons(
                title: ContactsController.of(context).contactsModel!.data!.data![index].value,
                onClick: (){
                  print(ContactsController.of(context).contactsModel!.data!.data![index].value);
                  // TODO: Call Url Launcher Here
                  if(ContactsController.of(context).contactsModel!.data!.data![index].type == 1){
                    // Launch Tel
                    var _phone=ContactsController.of(context).contactsModel!.data!.data![index].value;
                    canLaunch ('tel:$_phone');
                    launch(
                      _phone!,
                      forceSafariVC: false,
                      forceWebView: false,
                    );
                    print('1');
                  }else if(ContactsController.of(context).contactsModel!.data!.data![index].type == 2){

                    // Launch Mail To
                    print('2');
                  } else {
                    var url=ContactsController.of(context).contactsModel!.data!.data![index].value;
                     canLaunch (url!);
                   launch(
                  url,
                  forceSafariVC: false,
                  forceWebView: false,
                  );
                  }
                    // Launch Https
                    print('3');

                  }

              )
        ),

      ),
    );
  }
}
class CustomButtons extends StatelessWidget {
  final String? title;
    final Function() onClick;
    CustomButtons({required this.title,required this.onClick});
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      onClick();

    }, child: Text(title!));
  }
}

//Padding(
//       padding: const EdgeInsets.only(right: 15.0, left: 15, top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           BlocBuilder(
//             bloc: ContactsController.of(context),
//             builder: (context, state) {
//               if (state is ContactsLoading)
//                 return Column(
//                     children:[
//                       Container(
//                           height:110,
//                           width: 110,
//                           child: CircularProgressIndicator()),
//                       Text("Looding"),
//                     ]
//                 );
//               final Contacts=ContactsController.of(context).contactsModel!.data!.data![0].value;
//               final Contacts1=ContactsController.of(context).contactsModel!.data!.data![1].value;
//               final Contacts2=ContactsController.of(context).contactsModel!.data!.data![2].value;
//               final Contacts3=ContactsController.of(context).contactsModel!.data!.data![3].value;
//               return Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [BoxShadow(color: Colors.white, blurRadius: 5)],
//                   color: Color(0xcd9dddde),
//                 ),
//                 child: Column(
//                     children:[
//                       TextButton(onPressed: ()async{
//                         if (await canLaunch(Contacts!)) {
//                           await launch(
//                             Contacts,
//                             forceSafariVC: false,
//                             forceWebView: false,
//                           );
//                         } else {
//                           throw 'Could not launch $Contacts';
//
//
//                           // _launched =  _launchInBrowser(Contacts[index].value!.toString());
//
//
//                         }
//                       }, child: Text("facebook")),
//                       TextButton(onPressed: ()async{
//                         if (await canLaunch(Contacts1!)) {
//                           await launch(
//                             Contacts1,
//                             forceSafariVC: false,
//                             forceWebView: false,
//                           );
//                         } else {
//                           throw 'Could not launch $Contacts1';
//
//
//                           // _launched =  _launchInBrowser(Contacts[index].value!.toString());
//
//
//                         }
//                       }, child: Text("Instgram")),
//
//                     ]
//                 ),
//               );
//
//             },
//           ),
//
//         ],
//       ),
//
//     );
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//import 'package:cce/widgets/controller_state.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ControllerCubit extends Cubit<ControllerState> {
//
//
//   ControllerCubit() : super(ControllerInitial());
//   static ControllerCubit of (context) =>BlocProvider.of(context);
//
//   final List list=[];
//   final List lists=[
//     "aaa",
//     "bbb",
//     "ccc",
//     "eee",
//     "rrr",
//     "yyy",
//     "uuu",
//     "iii",
//     "ooo",
//     "qqq",
//   ];
//
//   void Fuction(value){
//     final x = list.indexWhere((element) => element.Level == value.Level);
//     if(x != -1) return;
//     list.add(value);
//     emit(ControllerLoading());
//
//
//
//   }
//
// }
