import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'rsi_model.dart';
export 'rsi_model.dart';

class RsiWidget extends StatefulWidget {
  const RsiWidget({super.key});

  @override
  State<RsiWidget> createState() => _RsiWidgetState();
}

class _RsiWidgetState extends State<RsiWidget> with TickerProviderStateMixin {
  late RsiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RsiModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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
    return StreamBuilder<List<RsiRecord>>(
      stream: queryRsiRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<RsiRecord> rsiRsiRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final rsiRsiRecord =
            rsiRsiRecordList.isNotEmpty ? rsiRsiRecordList.first : null;

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
                      'RSI',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0, 0),
                                  child: FlutterFlowButtonTabBar(
                                    useToggleButtonStyle: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    unselectedLabelStyle: TextStyle(),
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    unselectedBackgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderColor: Color(0xA44B39EF),
                                    unselectedBorderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2,
                                    borderRadius: 8,
                                    elevation: 0,
                                    buttonMargin:
                                        EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                    padding: EdgeInsets.all(4),
                                    tabs: [
                                      Tab(
                                        text: 'Above 70',
                                      ),
                                      Tab(
                                        text: 'Below 30',
                                      ),
                                      Tab(
                                        text: 'Between',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 5),
                                          child: Builder(
                                            builder: (context) {
                                              final above60 = rsiRsiRecord
                                                      ?.above60
                                                      ?.toList() ??
                                                  [];

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount: above60.length,
                                                itemBuilder:
                                                    (context, above60Index) {
                                                  final above60Item =
                                                      above60[above60Index];
                                                  return Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Container(
                                                      width: 378,
                                                      height: 81,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x8E39D2C0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                above60Item,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          30,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
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
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Builder(
                                            builder: (context) {
                                              final below40 = rsiRsiRecord
                                                      ?.below40
                                                      ?.toList() ??
                                                  [];

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount: below40.length,
                                                itemBuilder:
                                                    (context, below40Index) {
                                                  final below40Item =
                                                      below40[below40Index];
                                                  return Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Container(
                                                      width: 378,
                                                      height: 81,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x92FF5963),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                below40Item,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          30,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
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
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Builder(
                                            builder: (context) {
                                              final between = rsiRsiRecord
                                                      ?.between
                                                      ?.toList() ??
                                                  [];

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount: between.length,
                                                itemBuilder:
                                                    (context, betweenIndex) {
                                                  final betweenItem =
                                                      between[betweenIndex];
                                                  return Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Container(
                                                      width: 378,
                                                      height: 81,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xBAF9CF58),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Text(
                                                                betweenItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      fontSize:
                                                                          30,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ],
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
