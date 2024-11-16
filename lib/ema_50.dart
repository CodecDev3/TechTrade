import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ema50_model.dart';
export 'ema50_model.dart';

class Ema50Widget extends StatefulWidget {
  const Ema50Widget({super.key});

  @override
  State<Ema50Widget> createState() => _Ema50WidgetState();
}

class _Ema50WidgetState extends State<Ema50Widget>
    with TickerProviderStateMixin {
  late Ema50Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Ema50Model());

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
    return StreamBuilder<List<EmaRecord>>(
      stream: queryEmaRecord(
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
        List<EmaRecord> ema50EmaRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final ema50EmaRecord =
            ema50EmaRecordList.isNotEmpty ? ema50EmaRecordList.first : null;

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
                      'EMA_50',
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
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
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
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
                                        text: 'Above',
                                      ),
                                      Tab(
                                        text: 'Below',
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
                                        padding: EdgeInsets.all(3),
                                        child: Builder(
                                          builder: (context) {
                                            final above = ema50EmaRecord
                                                    ?.aboveEma50
                                                    ?.toList() ??
                                                [];

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount: above.length,
                                              itemBuilder:
                                                  (context, aboveIndex) {
                                                final aboveItem =
                                                    above[aboveIndex];
                                                return Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Container(
                                                    width: 378,
                                                    height: 81,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              aboveItem,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    fontSize:
                                                                        20,
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
                                      Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Builder(
                                          builder: (context) {
                                            final below = ema50EmaRecord
                                                    ?.belowEma50
                                                    ?.toList() ??
                                                [];

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount: below.length,
                                              itemBuilder:
                                                  (context, belowIndex) {
                                                final belowItem =
                                                    below[belowIndex];
                                                return Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Container(
                                                    width: 378,
                                                    height: 81,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x92FF5963),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              belowItem,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        18,
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
