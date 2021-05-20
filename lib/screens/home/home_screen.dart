import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_demo/data_access/data_access.dart';
import 'package:flutter_demo/model/model.dart';
import 'package:flutter_demo/screens/home/bloc/home_bloc.dart';
import 'package:flutter_demo/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter_demo/shared/app_colors.dart';
import 'package:flutter_demo/shared/app_text_styles.dart';
import 'package:flutter_demo/shared/utils.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(user, AbstractRepository.mock(context)),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: getSafeHeight(context),
                child: Column(
                  children: [
                    _buildHeader(context),
                    Expanded(
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is HomeLoadingStocks) {
                            return _buildLoadingState();
                          } else if (state is HomeLoadedStocks) {
                            return Column(
                              children: [
                                // Expanded(child: _buildUpper(context, state)),
                                Expanded(child: _buildUnder(context, state)),
                              ],
                            );
                          } else if (state is HomeFailedLoadingStocks) {
                            return _buildFailedLoadingState(
                                state.exception.toString());
                          } else if (state is HomeEmptyStocks) {
                            return _buildEmptyState();
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

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'No stock found, please adjust your selection',
        style:
            AppTextStyles.italicRegular16.copyWith(color: AppColors.errorColor),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) => Container(
        height: kToolbarHeight,
        padding: const EdgeInsets.only(left: 32.0, right: 12.0),
        child: Row(
          children: [
            Text(
              'Welcome, ${user.fullName}',
              style: AppTextStyles.italicRegular16
                  .copyWith(color: AppColors.primaryColor),
            ),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: AppColors.primaryColor,
                ),
                onPressed: () =>
                    BlocProvider.of<AuthBloc>(context).add(LogOut()))
          ],
        ),
      );

  Widget _buildUpper(BuildContext context, HomeLoadedStocks state) {
    return Container();
  }

  Widget _buildUnder(BuildContext context, HomeLoadedStocks state) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: state.stockTickers
            .map((ticker) => StockTickerWidget(ticker: ticker))
            .toList(),
      ),
    );
  }
}

class StockTickerWidget extends StatelessWidget {
  final StockTicker ticker;

  const StockTickerWidget({Key? key, required this.ticker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${ticker.symbol} - ${ticker.name}',
                    style: AppTextStyles.normalBold16.copyWith(color: AppColors.primaryColor),
                  ),
                ),
                Text(
                  '${ticker.stock}',
                  style: AppTextStyles.normalBold16.copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Market cap: ${ticker.marketCap}',
                    style: AppTextStyles.normalBold16,
                  ),
                ),
                Text(
                  '${ticker.country}',
                  style: AppTextStyles.normalBold16,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              'Last sale: ${ticker.lastSale}',
              style: AppTextStyles.normalBold16,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${ticker.sector}',
                    style: AppTextStyles.normalBold16.copyWith(color: AppColors.secondaryColor),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${ticker.industry}',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.normalBold16.copyWith(color: AppColors.secondaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
