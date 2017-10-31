<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/lib/jindo2.all.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/lib/jindo_component.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/SE2M_Configuration.js" charset="utf-8"></script>	<!-- 설정 파일 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/SE2BasicCreator.js" charset="utf-8"></script>
        <!--HuskyApp JS Start-->
        <!-- 허스키 프레임웍 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/husky_framework/HuskyCore.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/husky_framework/HuskyRange.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/husky_framework/hp_CorePlugin.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/husky_framework/hp_HuskyRangeManager.js" charset="utf-8"></script>
        <!-- 공통 : 기본 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/base/hp_SE2M_Toolbar.js" charset="utf-8"></script>
        <!-- 편집 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/editing/hp_SE_EditingAreaManager.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/editing/hp_SE_EditingArea_WYSIWYG.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/editing/hp_SE_EditingArea_HTMLSrc.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/editing/hp_SE_EditingArea_TEXT.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/editing/hp_SE_EditingAreaVerticalResizer.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/editing/hp_SE_WYSIWYGEnterKey.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/editing/hp_SE2M_EditingModeChanger.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/editing/hp_SE_PasteHandler.js" charset="utf-8"></script>
        <!-- 1단 툴바 : 기본 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_ExecCommand.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE_WYSIWYGStyler.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE_WYSIWYGStyleGetter.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_FontSizeWithLayerUI.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_LineStyler.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_LineHeightWithLayerUI.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_ColorPalette.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_FontColor.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_BGColor.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_Hyperlink.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_FontNameWithLayerUI.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/colorpicker.js" charset="utf-8"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_Accessibility.js" charset="utf-8"></script>
        <!-- 1단 툴바 : 확장 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_SCharacter.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_FindReplacePlugin.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_Quote.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_TableCreator.js" charset="utf-8"></script>		
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_TableBlockStyler.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_StyleRemover.js" charset="utf-8"></script>	
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_TableEditor.js" charset="utf-8"></script>
        <!-- 퀵에디터 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/quick_editor/hp_SE2M_QuickEditor_Common.js" charset="utf-8"></script>
        <!-- 단축키 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/shortcut/shortcut.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/shortcut/hp_Hotkey.js" charset="utf-8"></script>
        <!-- Undo/Redo -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/undo_redo/hp_SE_UndoRedo.js" charset="utf-8"></script>
        <!-- 유틸 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_Utils.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_DialogLayerManager.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_ActiveLayerManager.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_StringConverterManager.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_MessageManager.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_LazyLoader.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_PopupManager.js" charset="utf-8"></script>	 
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_SE2M_Utils.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_SE2B_CSSLoader.js" charset="utf-8"></script>		<!-- Basic 버전에서 사용하지 않는 메시지를 제거한 버전 -->
        <!-- SE2.0 Open 전용 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/husky_SE2B_Lang_ko_KR.js" charset="utf-8"></script><!-- Basic 버전에서 사용하는 알림 메시지 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/husky_SE2B_Lang_en_US.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/husky_SE2B_Lang_ja_JP.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/husky_SE2B_Lang_zh_CN.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/husky_SE2B_Lang_zh_TW.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/hp_SE_OuterIFrameControl.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/hp_SE_ToolbarToggler.js" charset="utf-8"></script>
        <!--HuskyApp JS End-->
        <!--Remove Start-->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_FindReplacePlugin$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_Quote$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_SCharacter$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_TableCreator$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/hp_SE2M_TableEditor$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_BGColor$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_FontColor$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_Hyperlink$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/base/hp_SE2M_LineHeightWithLayerUI$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/quick_editor/hp_SE2M_QuickEditor_Common$Lazy.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/hp_DialogLayerManager$Lazy.js" charset="utf-8"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/N_FindReplace.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/fundamental/advanced/SE2M_TableTemplate.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/util/N_DraggableLayer.js" charset="utf-8"></script>
        <!--Remove End-->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/service/HuskyEZCreator.js" charset="utf-8"></script>