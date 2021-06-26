import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButton extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback secundaryOnPressed;
  final bool enablePrimaryColor;

  const SetLabelButton(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secundaryLabel,
      required this.secundaryOnPressed,
      this.enablePrimaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shape,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: this.primaryLabel,
              onPressed: this.primaryOnPressed,
              style: this.enablePrimaryColor ? TextStyles.buttonPrimary : null,
            ),
          ),
          DividerverticalWidget(),
          Expanded(
            child: LabelButton(
              label: this.secundaryLabel,
              onPressed: this.primaryOnPressed,
            ),
          ),
        ],
      ),
    );
  }
}
