import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_demo/data_access/data_access.dart';
import 'package:flutter_demo/model/model.dart';
import 'package:flutter_demo/screens/instruction/bloc/instruction_bloc.dart';
import 'package:flutter_demo/shared/app_colors.dart';
import 'package:flutter_demo/shared/app_text_styles.dart';
import 'package:flutter_demo/shared/utils.dart';
import 'package:flutter_demo/shared/widgets/app_button.dart';
import 'package:flutter_demo/screens/auth/bloc/auth_bloc.dart';

class InstructionScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const InstructionScreen({Key? key, required this.navigatorKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InstructionBloc>(
      create: (_) => InstructionBloc(BlocProvider.of<AuthBloc>(context),
          AbstractRepository.mock(context), navigatorKey),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            body: SafeArea(
              child: Container(
                height: getSafeHeight(context),
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Expanded(child: _buildHeader()),
                    Expanded(
                      flex: 2,
                      child: BlocBuilder<InstructionBloc, InstructionState>(
                        builder: (context, state) {
                          if (state is InstructionLoadingTags) {
                            return _buildLoadingState();
                          } else if (state is InstructionLoadedTags) {
                            return _buildActions(context, state);
                          } else if (state is InstructionFailedLoadingTags) {
                            return _buildFailedLoadingState(
                                state.exception.toString());
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16.0),
          Expanded(
            child: Center(
              child: DefaultTextStyle(
                style: AppTextStyles.normalBold40
                    .copyWith(color: AppColors.primaryColor),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('FLUTTER DEMO'),
                    RotateAnimatedText('INSTRUCTION'),
                  ],
                  repeatForever: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: PlatformCircularProgressIndicator(),
    );
  }

  Widget _buildFailedLoadingState(String message) {
    return Center(
      child: Text(
        message,
        style:
            AppTextStyles.italicRegular16.copyWith(color: AppColors.errorColor),
      ),
    );
  }

  Widget _buildActions(BuildContext context, InstructionLoadedTags state) {
    return Column(
      children: [
        /// Instruction tags
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: state.stockTags.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please select your interest stock',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.italicRegular16
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: state.stockTags
                            .map((tag) =>
                                InstructionTagWidget(instructionTag: tag))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Visibility(
                  visible: state.sectorTags.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please select your interest sector',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.italicRegular16
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: state.sectorTags
                            .map((tag) =>
                                InstructionTagWidget(instructionTag: tag))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Visibility(
                  visible: state.riskTags.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please select your risk level',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.italicRegular16
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: state.riskTags
                            .map((tag) =>
                                InstructionTagWidget(instructionTag: tag))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Next/Submit button
        AppButton(
          label: 'NEXT',
          onPressed: () {
            BlocProvider.of<InstructionBloc>(context).add(
                SubmitInstructionEvent(
                    state.riskTags.where((tag) => tag.isSelected).toList(),
                    state.sectorTags.where((tag) => tag.isSelected).toList(),
                    state.stockTags.where((tag) => tag.isSelected).toList()));
          },
        ),
      ],
    );
  }
}

class InstructionTagWidget extends StatefulWidget {
  final InstructionTag instructionTag;

  const InstructionTagWidget({Key? key, required this.instructionTag})
      : super(key: key);

  @override
  _InstructionTagWidgetState createState() => _InstructionTagWidgetState();
}

class _InstructionTagWidgetState extends State<InstructionTagWidget> {
  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
        duration: Duration(milliseconds: 80),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: widget.instructionTag.isSelected
                ? AppColors.secondaryColor
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            widget.instructionTag.name,
            style: AppTextStyles.normalRegular16
                .copyWith(color: AppColors.onPrimaryColor),
          ),
        ),
        onPressed: () {
          setState(() {
            widget.instructionTag.isSelected =
                !widget.instructionTag.isSelected;
          });
        });
  }
}
