import 'dart:io';
import 'dart:math' as math;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../services/local/shared_prefs.dart';
import '../app_avatar.dart';

class FoodieAppBar extends StatefulWidget implements PreferredSizeWidget {
  FoodieAppBar({
    super.key,
    this.leftPressed,
    this.color,
    Icon? icon,
    required this.title,
  }) : icon = icon ??
            Icon(Icons.arrow_back_ios_new,
                color: Colors.brown.withOpacity(0.8));

  final Function()? leftPressed;
  final Color? color;
  final Icon? icon;
  final String title;

  @override
  State<FoodieAppBar> createState() => _FoodieAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(86.0);
}

class _FoodieAppBarState extends State<FoodieAppBar> {
  SharedPrefs prefs = SharedPrefs();
  String? avatar;

  @override
  void initState() {
    super.initState();
    _getAvatar();
  }

  Future<void> _pickAvatar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.media,
    );
    if (result != null) {
      prefs.saveAvatarPath(result.files.single.path!);
    }
  }

  void _getAvatar() {
    prefs.getAvatarPath().then((strAvatar) {
      File(strAvatar ?? '').exists().then((value) {
        if (value) {
          avatar = strAvatar;
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
          top: MediaQuery.of(context).padding.top + 6.0, bottom: 12.0),
      color: widget.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.leftPressed,
            child: Transform.rotate(
              angle: 45 * math.pi / 180,
              child: Container(
                padding: const EdgeInsets.all(6.8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Transform.rotate(
                    angle: -45 * math.pi / 180, child: widget.icon),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await _pickAvatar();
              _getAvatar();
            },
            child: AppAvatar(avatar: avatar, isActive: true),
          ),
        ],
      ),
    );
  }
}
