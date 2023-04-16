import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import 'detail_content.dart';
import 'content_viewModel.dart';

class ContentList extends StatefulWidget {
  const ContentList({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<ContentViewModel>(context, listen: false).getContentFromApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final contentProvider = Provider.of<ContentViewModel>(context);
    return Consumer<ContentViewModel>(builder: (context, state, child) {
      if (state.stateType == ContentViewState.loading) {
        return const CircularProgressIndicator();
      } else if (state.stateType == ContentViewState.error) {
        return const Center(
          child: Text('Gagal mengambil data'),
        );
      } else {
        return AnimationLimiter(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contentProvider.content.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Color(0xff261865))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailContent(
                                        gambar: contentProvider
                                            .content[index].gambar!,
                                        header: contentProvider
                                            .content[index].header!,
                                        body: contentProvider
                                            .content[index].body!,
                                        paragraf1: contentProvider
                                            .content[index].paragraf1!,
                                        paragraf2: contentProvider
                                            .content[index].paragraf2!,
                                        paragraf3: contentProvider
                                            .content[index].paragraf3!)));
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      contentProvider.content[index].gambar!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 17,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, bottom: 8, top: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(contentProvider.content[index].header!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.start),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      contentProvider.content[index].body!,
                                      maxLines: 3,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
                //
              }),
        );
      }
    });
  }
}
