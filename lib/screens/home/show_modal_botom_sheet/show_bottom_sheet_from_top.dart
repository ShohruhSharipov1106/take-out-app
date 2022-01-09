import 'package:flutter/cupertino.dart';
import 'package:take_out_app/constants/imports.dart';



class FilterSheet {
  TabController tabController;
  Icon icon;
  FilterSheet({required this.tabController, required this.icon});

  showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        enableDrag: true,
        elevation: 0,
        isScrollControlled: true,
        context: ctx,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: getHeight(403),
              width: getWidth(375),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: getHeight(20),
                        bottom: getWidth(24),
                        top: getWidth(10)),
                    child: SizedBox(
                      height: getHeight(15),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            CupertinoIcons.xmark,
                            size: 30,
                            color: Color(0xFF7E8389),
                          )),
                    ),
                  ),
                  TabBar(
                    onTap: (v) {
                      setState(() {});
                    },
                    physics: const BouncingScrollPhysics(),
                    controller: tabController,
                    indicatorColor: const Color(0xFFE92F48),
                    dragStartBehavior: DragStartBehavior.start,
                    unselectedLabelColor: const Color(0xFF7E8389),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: const Color(0xFF424242),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    unselectedLabelStyle: const TextStyle(
                      color: Color(0xFF7E8389),
                    ),
                    tabs: [
                      tabsMethod(text: 'Sort', son: 0),
                      tabsMethod(text: 'Delivery', son: 1),
                      tabsMethod(text: 'Dietary', son: 2)
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: const [
                        SortTab(),
                        DeliveryTab(),
                        DietaryTab(),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0,
                    thickness: 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(vertical: getHeight(18)),
                        ),
                        child: Text(
                          'DONE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getHeight(16),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }

  Tab tabsMethod({String? text, int? son}) {
    return Tab(
      child: SizedBox(
          width: getWidth(80),
          child: Row(
            children: [
              Text(
                text!,
                style: TextStyle(fontSize: getHeight(18)),
              ),
              SizedBox(width: getWidth(6)),
              tabController.index == son! ? icon : const Center()
            ],
          )),
    );
  }
}
