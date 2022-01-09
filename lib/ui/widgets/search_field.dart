import 'package:take_out_app/constants/imports.dart';

class SearchFeild extends StatelessWidget {
  const SearchFeild(
      {required this.onChanged,
      required this.onTap,
      this.readOnly = false,
      required this.controller});
  final void Function(String) onChanged;
  final void Function() onTap;
  final bool readOnly;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      cursorColor: kDeepGrey,
      decoration: InputDecoration(
        hintText: 'Search by restaurant or entrée',
        hintStyle: TextStyle(color: kDeepGrey, fontSize: getWidth(13.0)),
        prefixIcon: Padding(
          child: assetIcon(
            color: kDeepGrey,
            height: 14.36,
            width: 14.36,
            path: 'assets/icons/search.svg',
          ),
          padding: EdgeInsets.only(left: getWidth(10.0), right: getWidth(15.0)),
        ),
        prefixIconConstraints: const BoxConstraints(),
        suffixIcon: Padding(
          child: assetIcon(
            color: kDeepGrey,
            height: 14.36,
            width: 14.36,
            path: 'assets/icons/voice_search.svg',
          ),
          padding: EdgeInsets.only(right: getWidth(10.0)),
        ),
        suffixIconConstraints: const BoxConstraints(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getWidth(10.0)),
          borderSide: BorderSide.none,
        ),
        fillColor: kFilledField,
        constraints: const BoxConstraints(),
        contentPadding: EdgeInsets.symmetric(horizontal: getWidth(10.0)),
        filled: true,
      ),
    );
  }
}
