import 'package:flutter/material.dart';

class MusicItem extends StatelessWidget {
  final String image;
  final String musicName;
  final String artist;
  final VoidCallback onTap;
  const MusicItem(
      {super.key,
      required this.image,
      required this.musicName,
      required this.artist,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TapDownDetails tapDownPosition = TapDownDetails();

    void showItemOptions(BuildContext context, TapDownDetails details) {
      final RenderBox overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox;

      final position = RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        overlay.size.width - details.globalPosition.dx,
        overlay.size.height - details.globalPosition.dy,
      );

      showMenu(
        color: const Color.fromARGB(255, 242, 242, 242),
        context: context,
        position: position,
        items: <PopupMenuEntry>[
          const PopupMenuItem(
            value: 'delete',
            child: Text('Delete'),
          ),
          const PopupMenuItem(
            value: 'edit',
            child: Text('Edit'),
          ),
          const PopupMenuItem(
            value: 'share',
            child: Text('Share'),
          ),
        ],
      ).then((value) {
        if (value == 'delete') {
        } else if (value == 'edit') {
        } else if (value == 'share') {}
      });
    }

    return InkWell(
      onTap: onTap,
      onTapDown: (TapDownDetails details) {
        tapDownPosition = details;
      },
      onLongPress: () {
        showItemOptions(context, tapDownPosition);
      },
      child: SizedBox(
        height: 65.0,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(360.0),
              child: Image.asset(
                image,
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              width: screenWidth - 100,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    musicName,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    artist,
                    style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
