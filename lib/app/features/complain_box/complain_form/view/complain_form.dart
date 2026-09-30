import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:school_sys/app/core/custom_appbar.dart';
import 'package:school_sys/app/core/values/app_colors.dart';
import '../../../../core/values/text_styles.dart';
import '../bloc/form_bloc.dart';
import '../bloc/form_event.dart';
import '../bloc/form_state.dart';

class ComplainPage extends StatelessWidget {

  ComplainPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplainFormBloc(),
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        appBar:CustomAppBar(title: 'Submit a Complain'),
        body: BlocConsumer<ComplainFormBloc, ComplainFormState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Complaint submitted successfully')),
              );
            } else if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state.isSubmitting) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              padding:  EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Make Complain', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Please, write your complain here', style: TextStyle(fontSize: 12)),

                  SizedBox(height: 16),
                  Text('Date', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(

                      cursorColor: AppColors.appBarColor,
                      readOnly: true,
                      controller: TextEditingController(text: state.date),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey.shade100)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey.shade100)),
                        hintText: 'dd--mm--yy',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                              context.read<ComplainFormBloc>().add(DateChanged(formattedDate));
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),
                  Text('Complain Type', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonFormField<String>(
                      hint: Text('Select type',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                      value: state.complainType.isNotEmpty ? state.complainType : null,
                      items: ['Type A', 'Type B', 'Type C']
                          .map((type) => DropdownMenuItem(value: type, child: Text(type,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          context.read<ComplainFormBloc>().add(ComplainTypeChanged(val));
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 12,right: 8,),

                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade100)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey.shade100,
                            ),
                          ),
                      )
                    ),
                  ),

                  SizedBox(height: 12),
                  Text('Complain Detail', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      maxLines: 5,
                      onChanged: (value) => context.read<ComplainFormBloc>().add(DescriptionChanged(value)),
                      decoration: InputDecoration(
                        hintText: 'Complaint details',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.grey.shade100)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.shade100,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      final ImagePicker _picker = ImagePicker();
                      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        context.read<ComplainFormBloc>().add(ImagePicked(image));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height:  MediaQuery.of(context).size.height * 0.25,

                      color: Colors.grey.shade200,
                      child: state.image != null
                          ? Image.file(File(state.image!.path), fit: BoxFit.cover)
                          : Icon(Icons.camera_alt, size: 50),
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: state.isChecked
                            ? AppColors.appBarColor
                            : Colors.white,
                        value: state.isChecked,
                        onChanged: (val) {
                          if (val != null) {
                            context.read<ComplainFormBloc>().add(CheckboxToggled(val));
                          }
                        },
                      ),
                      Text('Are you sure to submit'),
                      Spacer(),
                      ElevatedButton(
                        onPressed: state.isChecked
                            ? () {
                          context.read<ComplainFormBloc>().add(SubmitComplain());
                        }
                        : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: state.isChecked
                              ? AppColors.appBarColor
                              : Colors.grey,
                        ),
                        child: Text('Submit',style: whiteText12,),
                      ),
                    ],
                  ),


                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
