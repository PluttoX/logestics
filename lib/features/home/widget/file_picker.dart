
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class FilePickerView extends StatefulWidget {
  const FilePickerView({super.key, required this.title});

  final String title;

  @override
  State<FilePickerView> createState() => _FilePickerViewState();
}

class _FilePickerViewState extends State<FilePickerView> {
  
  late ColorNotifier notifier;
  
  bool isHover = false;

  String? fileName;
  String? fileType;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
        fileType = result.files.single.extension;
      });
      debugPrint("=========================================$fileType");
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier = Provider.of(context,listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: "Outfit",
            color: notifier.text,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 7),
        Container(
          height: width < 650 ? 150 : 150,
          width: width,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: notifier.getfillborder),
          ),
          child: fileName == null
              ? Center(
                  child: InkWell(
                    onTap: _pickFile,
                    onHover: (value) {
                      setState(() {
                        isHover = value;
                      });
                    },
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: notifier.getfillborder,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/fileupload.png",
                              color: Colors.grey,
                              height: 20,
                            ),
                          ),
                          SizedBox(width: 15),
                          RichText(
                            text: TextSpan(
                              text: "Upload File ",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 17,
                                color: notifier.text,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'files\nor click here',
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: isHover
                                        ? Color(0xFF0f7bf4)
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  child: width < 650
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 1.3,
                              height: 50,
                              decoration: BoxDecoration(),
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color:notifier.getfillborder
                                    ),
                                  ),
                                  child: Image.asset(
                                    fileType == "png" ||
                                            fileType == "jpg" ||
                                            fileType == "svg" ||
                                            fileType == "avif" ||
                                            fileType == "psd" ||
                                            fileType == "jpeg" ||
                                            fileType == "jfif" ||
                                            fileType == "jxr" ||
                                            fileType == "tif" ||
                                            fileType == "jpe" ||
                                            fileType == "tiff" ||
                                            fileType == "bmp"
                                        ? "assets/images/image-file.png"
                                        : "assets/images/file-text.png",
                                    color: Colors.grey,
                                    height: 20,
                                  ),
                                ),
                                title: Text(
                                  fileName.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 13,
                                    color: notifier.text
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                subtitle: InkWell(
                                  onTap: () {
                                    setState(() {
                                      fileName = null;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/trash.png",
                                        height: 15,
                                        color: notifier.text,
                                      ),
                                      Text(
                                        " Remove",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: _pickFile,
                              child: Container(
                                margin: EdgeInsets.all(15),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: notifier.getfillborder
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/images/fileupload.png",
                                  color: Colors.grey,
                                  height: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 3,
                              // height: 70,
                              decoration: BoxDecoration(),
                              child: ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: notifier.getfillborder
                                    ),
                                  ),
                                  child: Image.asset(
                                    fileType == "png" ||
                                            fileType == "jpg" ||
                                            fileType == "svg" ||
                                            fileType == "avif" ||
                                            fileType == "psd" ||
                                            fileType == "jpeg" ||
                                            fileType == "jfif" ||
                                            fileType == "jxr" ||
                                            fileType == "tif" ||
                                            fileType == "jpe" ||
                                            fileType == "tiff" ||
                                            fileType == "bmp"
                                        ? "assets/images/image-file.png"
                                        : "assets/images/file-text.png",
                                    color: Colors.grey,
                                    height: 20,
                                  ),
                                ),
                                title: Text(
                                  fileName.toString(),
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 13,color: notifier.text,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                subtitle: InkWell(
                                  onTap: () {
                                    setState(() {
                                      fileName = null;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/trash.png",
                                        height: 15,
                                        color: notifier.text,
                                      ),
                                      Text(
                                        " Remove",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: _pickFile,
                              child: Container(
                                margin: EdgeInsets.all(15),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: notifier.getfillborder
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/images/fileupload.png",
                                  color: Colors.grey,
                                  height: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
        ),
      ],
    );
  }
}
