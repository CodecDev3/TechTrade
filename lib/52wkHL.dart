import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'h_l52wk_model.dart';
export 'h_l52wk_model.dart';

class HL52wkWidget extends StatefulWidget {
  const HL52wkWidget({super.key});

  @override
  State<HL52wkWidget> createState() => _HL52wkWidgetState();
}

class _HL52wkWidgetState extends State<HL52wkWidget>
    with TickerProviderStateMixin {
  late HL52wkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HL52wkModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: FlutterFlowTheme.of(context).info,
                      size: 40,
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 15),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'Home',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                            duration: Duration(milliseconds: 350),
                          ),
                        },
                      );
                    },
                    child: Icon(
                      Icons.home_outlined,
                      color: FlutterFlowTheme.of(context).info,
                      size: 30,
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  '52wk H/L',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 32,
                        letterSpacing: 0.0,
                      ),
                ),
                centerTitle: false,
                expandedTitleScale: 1.0,
              ),
              elevation: 2,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: StreamBuilder<List<YearHighLowRecord>>(
                  stream: queryYearHighLowRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<YearHighLowRecord> tabBarYearHighLowRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final tabBarYearHighLowRecord =
                        tabBarYearHighLowRecordList.isNotEmpty
                            ? tabBarYearHighLowRecordList.first
                            : null;

                    return Column(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: TextStyle(),
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent1,
                            unselectedBackgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            unselectedBorderColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2,
                            borderRadius: 8,
                            elevation: 0,
                            buttonMargin:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            padding: EdgeInsets.all(14),
                            tabs: [
                              Tab(
                                text: '52wk High',
                              ),
                              Tab(
                                text: '52wk Low',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Builder(
                                  builder: (context) {
                                    final high = tabBarYearHighLowRecord?.high52
                                            ?.toList() ??
                                        [];

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: high.length,
                                      itemBuilder: (context, highIndex) {
                                        final highItem = high[highIndex];
                                        return Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            width: 378,
                                            height: 81,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  highItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 28,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Builder(
                                  builder: (context) {
                                    final low = tabBarYearHighLowRecord?.low52
                                            ?.toList() ??
                                        [];

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: low.length,
                                      itemBuilder: (context, lowIndex) {
                                        final lowItem = low[lowIndex];
                                        return Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            width: 378,
                                            height: 81,
                                            decoration: BoxDecoration(
                                              color: Color(0x92FF5963),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  lowItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 28,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
