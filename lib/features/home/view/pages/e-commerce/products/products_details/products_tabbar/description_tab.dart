import 'package:flutter/material.dart';

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> orderList = [
      'Consequat imperdiet dolor a pretium.',
      'In pulvinar amet sagittis etiam imperdiet non pretium integer.',
      'Aenean ut facilisis tristique ut nam nam turpis facilisi vel.',
      'Vulputate dui phasellus vitae velit odio habitant',
      'Amet porta egestas augue purus tellus orci diam.',
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: width < 850
          ? EdgeInsets.all(10)
          : const EdgeInsets.only(left: 60, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          width < 850 ? Container() : SizedBox(height: 40),
          Text(
            "Nam dui tempor mi id. Risus nulla amet facilisis eu metus nulla. Nisi interdum nec in lectus amet dis. Pulvinar ut vulputate odio venenatis id urna.    Nullam elementum id egestas aliquet leo potenti pellentesque vel tortor. Varius integer facilisi vestibulum ante scelerisque adipiscing at turpis ultricies. Ullamcorper dui in in ultricies sodales in sapien. Elit lectus tincidunt tempus platea praesent. Mi dignissim faucibus fringilla egestas.",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 16,
              height: 2,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Nulla in consequat nisl quam. Arcu vulputate integer mauris adipiscing felis etiam. Leo morbi euismod egestas turpis velit. Mauris fames convallis  aliquet augue semper tortor sem. Amet aliquam urna mus aenean. Eu quam tristique at scelerisque id posuere.",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 16,
              height: 2,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          ListView.separated(
            itemCount: orderList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      orderList[index],
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);
            },
          ),
        ],
      ),
    );
  }
}
