part of '../DashBoard.dart';

class _TitleBar extends StatelessWidget {
  const _TitleBar({required this.data, required this.title});

  final AllDataManager data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: data.gettexttheme.fs16_regular,
        ),
        AppServices.addWidth(15),
        Expanded(
          child: GradientDivider(data: data),
        )
      ],
    );
  }
}
