import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:school_sys/app/core/custom_appbar.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';

import 'package:intl/intl.dart';

import '../../../core/values/url.dart';
import '../bloc/complain_bloc.dart';
import '../bloc/complain_event.dart';
import '../bloc/complain_state.dart';
import '../complain_form/view/complain_form.dart';
class Complain extends StatelessWidget {

  const Complain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComplainBloc()..add(FetchComplains()),
      child: Scaffold(

        appBar: CustomAppBar(title: 'Complain Box'),backgroundColor: AppColors.pageBackground,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ComplainBloc, ComplainState>(
            builder: (context, state) {
              if (state.isLoading) {
                return  Center(child:LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.appBarColor,
                size: 40,
              ));
              }
              if (state.errorMessage.isNotEmpty) return Text(state.errorMessage);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Past Complains', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.appBarColor)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.complainList.length,
                      itemBuilder: (context, index) {
                        final item = state.complainList[index];
                        final isExpanded = state.expandedCardIds.contains(item.id);

                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item.complainType ?? '', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                                      PopupMenuButton<String>(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(1),
                                        onSelected: (value) {
                                          if (value == 'delete') {
                                            context.read<ComplainBloc>().add(DeleteComplain(item.id));
                                          }
                                        },
                                        itemBuilder: (_) => const [
                                          PopupMenuItem(value: 'delete', child: Text('Delete')),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    item.complainDes ?? '',
                                    maxLines: isExpanded ? null : 2,
                                    overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () => context.read<ComplainBloc>().add(ToggleExpandCard(item.id)),
                                    child: Text(isExpanded ? 'See Less' : 'See More', style: greyText_13_400),
                                  ),
                                  const SizedBox(height: 16),
                                  GestureDetector(
                                    onTap: () {
                                      showImagePreview(context, '${AppUrl.baseImageUrl}/${item.img}');
                                    },
                                    child: const Text('See Attachment'),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${item.phone}', style: greyText_13_400),
                                      Text(DateFormat('hh:mm a, dd-MMMM-yyyy').format(DateTime.parse(item.date!)), style: greyText_13_400),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          color: Colors.white,
          surfaceTintColor: AppColors.appBarColor,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ComplainPage(),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.appBarColor, width: 1),
              ),
              child: const Center(child: Text('Add New Complain', style: blueText14_600)),
            ),
          ),
        ),
      ),
    );
  }

  void showImagePreview(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.network(imagePath, fit: BoxFit.cover),
            Positioned(
              top: -10,
              right: -10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 20),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
