import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_sys/app/core/custom_appbar.dart';
import 'package:school_sys/app/core/values/app_colors.dart';
import '../bloc/event_news_bloc.dart';
import '../bloc/event_news_state.dart';
import '../model/event_news_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';


class EventNewsPage extends StatelessWidget {
  const EventNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar:CustomAppBar(title: "Event & News"),
      body: BlocBuilder<EventNewsBloc, EventNewsState>(
        builder: (context, state) {
          if (state is EventNewsLoaded) {
            return ListView.builder(
              itemCount: state.newsList.length,
              itemBuilder: (context, index) {
                final event = state.newsList[index];
                return EventNewsTile(eventNewsUiData: event);
              },
            );
          } else if (state is EventNewsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("No events found"));
          }
        },
      ),
    );
  }
}

class EventNewsTile extends StatelessWidget {
  final EventNewsModel eventNewsUiData;

  const EventNewsTile({super.key, required this.eventNewsUiData});

  @override
  Widget build(BuildContext context) {
    final inputDate = DateTime.parse(eventNewsUiData.fromData);
    final formattedDate =
        "${inputDate.day.toString().padLeft(2, '0')}/${inputDate.month.toString().padLeft(2, '0')}/${inputDate.year}";

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EventNewsDetails(eventNewsUiData: eventNewsUiData),
        ),
      ),
      child: Card(
        color: Colors.white,elevation: 0,
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CachedNetworkImage(
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                imageUrl: "https://example.com${eventNewsUiData.imageLink}",
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error, size: 40),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(eventNewsUiData.name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(formattedDate,
                        style: const TextStyle(color: Colors.grey,fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(
                      eventNewsUiData.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black54,fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






class EventNewsDetails extends StatelessWidget {
  final EventNewsModel eventNewsUiData;

  const EventNewsDetails({super.key, required this.eventNewsUiData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: CustomAppBar(title: 'Event & News'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://your-image-base-url.com${eventNewsUiData.imageLink}",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
               Container(height: 250,
                   child: Center(child: const Icon(Icons.error))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventNewsUiData.fromData,
                    style: const TextStyle(color: AppColors.appBarColor),
                  ),
                  const SizedBox(height: 8),
                  Text(eventNewsUiData.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(eventNewsUiData.description,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
