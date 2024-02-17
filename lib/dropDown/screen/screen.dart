import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../bloc/dropDown_bloc.dart';
import '../bloc/dropDown_event.dart';
import '../bloc/dropDown_state.dart';
import '../model/model.dart';
import '../repo/repo.dart';


class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var dropdownvalue;
    var dropdownvalueSubject;
    int i=0;
    String? dropdownValue;
    List list = [];
    //dropdown_textfield
    SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
      static final List<String> fruits = [];
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _dropDownSearchController = TextEditingController();
    String? _selectedFruit;
 static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(fruits);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DropDownBloc(
          RepositoryProvider.of<DropDownRepo>(context),
        )..add(
            DropDownLoadEvent(),
          ),
   child:Scaffold(
     body:  BlocBuilder<DropDownBloc, DropDownState>(
           builder: (context, state) {
         if (state is DropDownLoadingState) {
           return const Center(
             child: CircularProgressIndicator(),
           );
         }
         if (state is DropDownErrorState) {
           return const Center(
             child: Text("Empty"),
           );
         }
         if (state is DropDownLoadedState) {
           List<DropDownModel> dataList = state.users;
           for(i;i<=dataList.length-1;i++){
             fruits.add(dataList[i].className!);
             print(dataList[i].className);
           }
           
           print(dataList);
           return Padding(
             padding: const EdgeInsets.only(top: 80.0),
             child: Column(
               children: <Widget>[
               
                 
                 DecoratedBox(
                 decoration: BoxDecoration( 
                    color:Colors.white, //background color of dropdown button
                    border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                    borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
                    // boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                    //        BoxShadow(
                    //            color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                    //            blurRadius: 5) //blur radius of shadow
                    //      ]
                 ),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 30.0),
                     child: Column(
                       children: [
                         ListView.builder(
                          padding: const EdgeInsets.all(0),
                           scrollDirection: Axis.vertical,
                           shrinkWrap: true,
                           itemCount: list.length,
                           itemBuilder: (_, index) {
                             return Row(
                               children: [
                                 Text(
                                      list[index] ?? '',
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                    IconButton(
                                           color: Colors.green,
                                           onPressed: () {
                                             setState(() {
                                               print(index);
                                               list.removeAt(index);
                                               
                                             });
                                             
                                           },
                                           icon: const Icon(Icons.cancel),
                                         ),
                               ],
                             );
                           }),
                         SizedBox(
                         height: 45,
                           child: DropDownSearchFormField(
                           
                                                     
                             textFieldConfiguration: const TextFieldConfiguration(
                             //autofocus: false,
                             enableInteractiveSelection: false,
                               //controller: this._dropDownSearchController,
                               decoration: InputDecoration(
                               enabledBorder: InputBorder.none,
                               focusedBorder: InputBorder.none,
                                 labelText: 'Fruit'
                               )
                             ),          
                             suggestionsCallback: (pattern) {
                             
                               return getSuggestions(pattern);
                             },
                             itemBuilder: (context, suggestion) {
                               return 
                               ListTile(
                                 title: 
                                 Text(suggestion.toString())
                                );
                             },
                             transitionBuilder: (context, suggestionsBox, controller) {
                               return suggestionsBox;
                             },
                             onSuggestionSelected: (suggestion) {
                             print(4);
                             setState(() {
                               list.add(suggestion.toString());
                             });
                               
                             },
                             validator: (value) {
                               if (value!.isEmpty) {
                                 return 'Please select a fruit';
                               }
                             },
                             onSaved: (value) => this._selectedFruit = value,
                           ),
                         )],
                     ),
                   ),
                 ),
                 // RaisedButton(
                 //   child: Text('Submit'),
                 //   onPressed: () {
                 //     if (this._formKey.currentState.validate()) {
                 //       this._formKey.currentState.save();
                 //       Scaffold.of(context).showSnackBar(SnackBar(
                 //         content: Text('Your Favorite Fruit is ${this._selectedFruit}')
                 //       ));
                 //     }
                 //   },
                 // )
               ],
             ),
           );
           //dropdown text filed. decorated dropdown menue
         /*  Padding(
           padding: EdgeInsets.only(top: 100),
             child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      iconSize: 40,
                      iconDisabledColor: Colors.blue,
                      iconEnabledColor: Colors.pink,
                      decoration: InputDecoration(
                        fillColor: Colors.yellow,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                      ),
                      hint: const Text('Select your favourite fruit'),
                      dropdownColor: Colors.greenAccent,
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Apple', 'Mango', 'Banana', 'Peach']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
           );*/
           //simple dropdown. Usable
           /*Padding(
             padding: const EdgeInsets.only(top: 80.0),
             child: DecoratedBox(
                      decoration: BoxDecoration( 
                         color:Colors.white, //background color of dropdown button
                         border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                         borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
                         // boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                         //        BoxShadow(
                         //            color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                         //            blurRadius: 5) //blur radius of shadow
                         //      ]
                      ),
                      
                      child:Padding(
                        padding: EdgeInsets.only(left:30, right:30),
                 child: DropdownButtonHideUnderline(
                   child: DropdownButton(
                   isExpanded: true,
                    hint: Text('Select Class'),
                    items: dataList.map((item) {
                      return DropdownMenuItem(
                        value: item.className.toString(),
                        child: Text(item.className.toString()),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        dropdownvalue = newVal;
                        print(dataList.first.classCode);
                      });
                    },
                    value: dropdownvalue,
                             ),
                 ),
               ),
             ),
           );*/
           
           // ListView.builder(
           //     scrollDirection: Axis.vertical,
           //     shrinkWrap: true,
           //     itemCount: dataList.length,
           //     itemBuilder: (_, index) {
           //       return GestureDetector(
           //       onTap: (){
           //          Navigator.pushNamed(
           //              context,
           //              '/complex'
           //            );
           //       },
           //         child: Text(
           //         dataList[index].className ?? "View Image",
           //         style: TextStyle(
           //           color: Colors.black,
           //           fontSize: 16,
           //           fontWeight: FontWeight.bold,
           //           fontFamily: 'OpenSans',
           //         ),
           //                                        ),
           //       );
           //     });
         }
         return Container();
       }),
     ));
  }
}
