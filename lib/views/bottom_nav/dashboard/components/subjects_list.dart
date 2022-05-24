part of dashboard;

class SubjectsList extends StatefulWidget {
  const SubjectsList({Key? key}) : super(key: key);

  @override
  _SubjectsListState createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: 2,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: null, //subjectRoute for user and addQuizRoute for admin
          child: Stack(
            children: [
              // CachedNetworkImage(
              //   imageUrl: "https://picsum.photos/seed/picsum/200/300",
              //   imageBuilder: (context, imageProvider) => Container(
              //     decoration: BoxDecoration(
              //       borderRadius: const BorderRadius.all(Radius.circular(10)),
              //       image: DecorationImage(
              //         image: imageProvider,
              //         fit: BoxFit.cover,
              //         // colorFilter: ColorFilter.mode(
              //         //     Colors.purple, BlendMode.colorBurn),
              //       ),
              //     ),
              //   ),
              //   progressIndicatorBuilder: (context, url, downloadProgress) =>
              //       const Center(
              //     child: CircularProgressIndicator.adaptive(
              //       backgroundColor: Colors.deepPurple,
              //     ),
              //   ),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              // ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.black.withOpacity(.5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          " dashboardC.subjects[index].name!",
                          style: kLabelStyleBold.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
