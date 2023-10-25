import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'uploadphotoprofile_model.dart';
export 'uploadphotoprofile_model.dart';

class UploadphotoprofileWidget extends StatefulWidget {
  const UploadphotoprofileWidget({Key? key}) : super(key: key);

  @override
  _UploadphotoprofileWidgetState createState() =>
      _UploadphotoprofileWidgetState();
}

class _UploadphotoprofileWidgetState extends State<UploadphotoprofileWidget> {
  late UploadphotoprofileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadphotoprofileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
              shape: BoxShape.circle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
              child: Container(
                width: 120.0,
                height: 120.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  imageUrl: valueOrDefault<String>(
                    _model.uploadedFileUrl,
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              final selectedMedia = await selectMediaWithSourceBottomSheet(
                context: context,
                storageFolderPath: 'galeria',
                allowPhoto: true,
              );
              if (selectedMedia != null &&
                  selectedMedia.every(
                      (m) => validateFileFormat(m.storagePath, context))) {
                setState(() => _model.isDataUploading = true);
                var selectedUploadedFiles = <FFUploadedFile>[];

                var downloadUrls = <String>[];
                try {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  selectedUploadedFiles = selectedMedia
                      .map((m) => FFUploadedFile(
                            name: m.storagePath.split('/').last,
                            bytes: m.bytes,
                            height: m.dimensions?.height,
                            width: m.dimensions?.width,
                            blurHash: m.blurHash,
                          ))
                      .toList();

                  downloadUrls = await uploadSupabaseStorageFiles(
                    bucketName: 'galeria',
                    selectedFiles: selectedMedia,
                  );
                } finally {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  _model.isDataUploading = false;
                }
                if (selectedUploadedFiles.length == selectedMedia.length &&
                    downloadUrls.length == selectedMedia.length) {
                  setState(() {
                    _model.uploadedLocalFile = selectedUploadedFiles.first;
                    _model.uploadedFileUrl = downloadUrls.first;
                  });
                  showUploadMessage(context, 'Success!');
                } else {
                  setState(() {});
                  showUploadMessage(context, 'Failed to upload data');
                  return;
                }
              }
            },
            text: 'Upload de imagem ',
            options: FFButtonOptions(
              height: 44.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              textStyle: FlutterFlowTheme.of(context).bodyMedium,
              elevation: 0.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
              hoverColor: FlutterFlowTheme.of(context).alternate,
              hoverBorderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
              hoverTextColor: FlutterFlowTheme.of(context).primaryText,
              hoverElevation: 3.0,
            ),
          ),
        ].divide(SizedBox(width: 16.0)),
      ),
    );
  }
}
