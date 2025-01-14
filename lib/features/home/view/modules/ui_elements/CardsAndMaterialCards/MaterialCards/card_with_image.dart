
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';

class CardWithImage extends StatefulWidget {
  const CardWithImage({
    super.key,
    required this.sizeStatus,
    required this.image,
    required this.imageheight,
    required this.imagewidth,
  });

  final String sizeStatus;
  final String image;
  final double imageheight;
  final double imagewidth;

  @override
  State<CardWithImage> createState() => _CardWithImageState();
}

class _CardWithImageState extends State<CardWithImage> {

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context,listen: true);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 6),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Card with media size"),
                  titleTextStyle: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color:notifier.text,
                  ),
                  subtitle: Text(widget.sizeStatus),
                  subtitleTextStyle: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 17,
                    color: notifier.greytext,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: widget.imageheight,
                width: widget.imagewidth,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "The Mateo Luca is the smallest of the six original and distinct spitz breeds of dog from Japan. A small, agile dog that copes very well with mountainous terrain, the Shiba Inu was originally bred for.",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 16,
              height: 2,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
