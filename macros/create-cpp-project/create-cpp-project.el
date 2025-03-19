;; Macros for create cpp project with CMake

;; Some settings:
(setq autor-name "Kirill Pshenichnyi <pshcyrill@mail.ru>")
(setq source-sub-dir "Source")
(setq cmake-minimum-required "3.30")
(setq cmake-cxx-standart "23")

(setq gnu-gpl-insert-license t)

;; Тут лучше не определять переменные, а сделать отдельные
;; интерактивные функции, чтобы можно было вносить изменения в уже
;; существующий проект
;; (defun cpp-project-add-tests ())
;; (defun cpp-project-add-qt-libs ())
;; ...
(setq add-tests t)
(setq add-qt-libs nil)
(setq add-libusb-lib nil)
(setq add-hdf5-lib nil)

(defun create-cpp-project (project-directory project-name)
  (interactive "fProject directory: \nsProject-name: \n")

  (require 'magit)

  (setq pathes (create-project-directory-if-not-exist
		project-directory project-name))
  (setq project-root-path (nth 0 pathes))
  (setq source-path (nth 1 pathes))

  (cd project-root-path)
  (magit-init project-root-path)

  ;; create .clang-format file
  (setq clang-format-buffer ".clang-format")
  (create-buffer-with-content
   clang-format-buffer
   clang-format-content)

  (setq cmake-lists-buffer "CMakeLists.txt")
  (create-buffer-with-content
   cmake-lists-buffer
   cmake-lists-content)
  (replace-from-start "@CMAKE-MIN-REQ@" cmake-minimum-required)
  (replace-from-start "@PROJECT-NAME@" project-name)
  (replace-from-start "@SOURCE-SUB-DIR@" source-path)
  (replace-from-start "@CMAKE-CXX-STANDART@" cmake-cxx-standart)

  ;; create .gitignore file
  (setq gitignore-buffer ".gitignore")
  (create-buffer-with-content
   gitignore-buffer
   gitignore-content)

  ;; cd to Source directory
  (cd source-path)

  (setq config-h-buffer "config.h.in")
  (create-buffer-with-content
   config-h-buffer
   config-h-content)
  (if gnu-gpl-insert-license
      (insert-to-cpp-gnu-gpl-license config-h-buffer project-name)
    )

  (setq main-cpp-buffer "main.cpp")
  (create-buffer-with-content
   main-cpp-buffer
   main-cpp-content)
  (if gnu-gpl-insert-license
      (insert-to-cpp-gnu-gpl-license main-cpp-buffer project-name)
    )

  ;; cd to tests path
  ;; create test files

  ;; (switch-to-buffer clang-format-buffer)
  (delete-other-windows)
  ;; (magit-commit-create)
  )
;; End of (create-cpp-project)


(defun datestamp () (format-time-string "%d.%m.%Y"))
(defun yearstamp () (format-time-string "%Y"))

(defun create-buffer-with-content (buffer-name content)
  (if (get-buffer buffer-name)
      (kill-buffer buffer-name))
  (switch-to-buffer buffer-name)
  (insert content)
  (write-file buffer-name)
  (magit-stage-file buffer-name)
  )

(defun mkdir-if-not-exist (dir)
  (if (not (file-directory-p dir))
      (mkdir dir))
  )

(defun create-project-directory-if-not-exist (project-directory project-name)
  (if (directory-name-p project-directory)
      (setq project-full-path
	    (concat project-directory project-name))
    )
  (if (not (directory-name-p project-directory))
      (setq project-full-path
	    (concat (concat project-directory "/") project-name))
    )

  (mkdir-if-not-exist project-full-path)

  (setq source-full-path (concat project-full-path (concat "/" source-sub-dir)))
  (mkdir-if-not-exist source-full-path)

  ;; Перенести в (cpp-project-add-tests)
  (if add-tests
      (setq test-full-path (concat source-full-path (concat "/" "tests")))
    )
  (if add-tests (mkdir-if-not-exist test-full-path))
  (setq retval (list project-full-path source-full-path))
  (if add-tests (append retval (list test-full-path)))
  )

;; Тут нужно сделать единый интерфейс, например insert-to-cpp-license
;; а в нем уже выбирать какую лицензию вставить

(defun insert-to-cpp-gnu-gpl-license (buffer-name project-name)
  (switch-to-buffer buffer-name)
  (beginning-of-buffer)
  (insert gnu-gpl-license-cpp-header-content)
  (replace-from-start "@AUTOR@" autor-name)
  (replace-from-start "@PROJECT-NAME@" project-name)
  (replace-from-start "@YEAR@" (yearstamp))
  (beginning-of-buffer)
  (write-file buffer-name)
  )

(defun replace-from-start (text1 text2)
  (beginning-of-buffer)
  (replace-regexp text1 text2)
  )

;; Недописана, идея в замене * на #
(defun insert-to-cmake-gnu-gpl-license (buffer-name project-name)
  (insert-to-cpp-gnu-gpl-license buffer-name project-name)
  (beginning-of-buffer)
  (rectangle-mark-mode 0)
  ;;  (isearch-forward "*/")
  ;;  (string-rectangle "#")
  )

;; Yoy can change this content for you format
(setq clang-format-content
      "---
Language:        Cpp
AccessModifierOffset: -8
AlignAfterOpenBracket: Align
AlignArrayOfStructures: None
AlignConsecutiveAssignments:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  AlignFunctionPointers: false
  PadOperators:    true
AlignConsecutiveBitFields:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  AlignFunctionPointers: false
  PadOperators:    false
AlignConsecutiveDeclarations:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  AlignFunctionPointers: false
  PadOperators:    false
AlignConsecutiveMacros:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  AlignFunctionPointers: false
  PadOperators:    false
AlignConsecutiveShortCaseStatements:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCaseArrows: false
  AlignCaseColons: false
AlignConsecutiveTableGenBreakingDAGArgColons:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  AlignFunctionPointers: false
  PadOperators:    false
AlignConsecutiveTableGenCondOperatorColons:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  AlignFunctionPointers: false
  PadOperators:    false
AlignConsecutiveTableGenDefinitionColons:
  Enabled:         false
  AcrossEmptyLines: false
  AcrossComments:  false
  AlignCompound:   false
  AlignFunctionPointers: false
  PadOperators:    false
AlignEscapedNewlines: Left
AlignOperands:   Align
AlignTrailingComments:
  Kind:            Always
  OverEmptyLines:  0
AllowAllArgumentsOnNextLine: true
AllowAllParametersOfDeclarationOnNextLine: true
AllowBreakBeforeNoexceptSpecifier: Never
AllowShortBlocksOnASingleLine: Never
AllowShortCaseExpressionOnASingleLine: true
AllowShortCaseLabelsOnASingleLine: false
AllowShortCompoundRequirementOnASingleLine: true
AllowShortEnumsOnASingleLine: false
AllowShortFunctionsOnASingleLine: All
AllowShortIfStatementsOnASingleLine: WithoutElse
AllowShortLambdasOnASingleLine: All
AllowShortLoopsOnASingleLine: true
AlwaysBreakAfterDefinitionReturnType: None
AlwaysBreakBeforeMultilineStrings: true
AttributeMacros:
  - __capability
BinPackArguments: true
BinPackParameters: false
BitFieldColonSpacing: Both
BraceWrapping:
  AfterCaseLabel:  false
  AfterClass:      false
  AfterControlStatement: Never
  AfterEnum:       false
  AfterExternBlock: false
  AfterFunction:   false
  AfterNamespace:  false
  AfterObjCDeclaration: false
  AfterStruct:     false
  AfterUnion:      false
  BeforeCatch:     false
  BeforeElse:      false
  BeforeLambdaBody: false
  BeforeWhile:     false
  IndentBraces:    false
  SplitEmptyFunction: true
  SplitEmptyRecord: true
  SplitEmptyNamespace: true
BreakAdjacentStringLiterals: true
BreakAfterAttributes: Leave
BreakAfterJavaFieldAnnotations: false
BreakAfterReturnType: None
BreakArrays:     true
BreakBeforeBinaryOperators: None
BreakBeforeConceptDeclarations: Always
BreakBeforeBraces: Attach
BreakBeforeInlineASMColon: OnlyMultiline
BreakBeforeTernaryOperators: true
BreakConstructorInitializers: BeforeColon
BreakFunctionDefinitionParameters: false
BreakInheritanceList: BeforeColon
BreakStringLiterals: true
BreakTemplateDeclarations: Yes
ColumnLimit:     80
CommentPragmas:  '^ IWYU pragma:'
CompactNamespaces: false
ConstructorInitializerIndentWidth: 4
ContinuationIndentWidth: 4
Cpp11BracedListStyle: true
DerivePointerAlignment: true
DisableFormat:   false
EmptyLineAfterAccessModifier: Never
EmptyLineBeforeAccessModifier: LogicalBlock
ExperimentalAutoDetectBinPacking: false
FixNamespaceComments: true
ForEachMacros:
  - foreach
  - Q_FOREACH
  - BOOST_FOREACH
IfMacros:
  - KJ_IF_MAYBE
IncludeBlocks:   Regroup
IncludeCategories:
  - Regex:           '^<ext/.*\.h>'
    Priority:        2
    SortPriority:    0
    CaseSensitive:   false
  - Regex:           '^<.*\.h>'
    Priority:        1
    SortPriority:    0
    CaseSensitive:   false
  - Regex:           '^<.*'
    Priority:        2
    SortPriority:    0
    CaseSensitive:   false
  - Regex:           '.*'
    Priority:        3
    SortPriority:    0
    CaseSensitive:   false
IncludeIsMainRegex: '([-_](test|unittest))?$'
IncludeIsMainSourceRegex: ''
IndentAccessModifiers: false
IndentCaseBlocks: false
IndentCaseLabels: true
IndentExternBlock: AfterExternBlock
IndentGotoLabels: true
IndentPPDirectives: None
IndentRequiresClause: true
IndentWidth:     8
IndentWrappedFunctionNames: false
InsertBraces:    false
InsertNewlineAtEOF: false
InsertTrailingCommas: None
IntegerLiteralSeparator:
  Binary:          0
  BinaryMinDigits: 0
  Decimal:         0
  DecimalMinDigits: 0
  Hex:             0
  HexMinDigits:    0
JavaScriptQuotes: Leave
JavaScriptWrapImports: true
KeepEmptyLines:
  AtEndOfFile:     false
  AtStartOfBlock:  false
  AtStartOfFile:   true
LambdaBodyIndentation: Signature
LineEnding:      DeriveLF
MacroBlockBegin: ''
MacroBlockEnd:   ''
MainIncludeChar: Quote
MaxEmptyLinesToKeep: 1
NamespaceIndentation: None
ObjCBinPackProtocolList: Never
ObjCBlockIndentWidth: 2
ObjCBreakBeforeNestedBlockParam: true
ObjCSpaceAfterProperty: false
ObjCSpaceBeforeProtocolList: true
PackConstructorInitializers: NextLine
PenaltyBreakAssignment: 2
PenaltyBreakBeforeFirstCallParameter: 1
PenaltyBreakComment: 300
PenaltyBreakFirstLessLess: 120
PenaltyBreakOpenParenthesis: 0
PenaltyBreakScopeResolution: 500
PenaltyBreakString: 1000
PenaltyBreakTemplateDeclaration: 10
PenaltyExcessCharacter: 1000000
PenaltyIndentedWhitespace: 0
PenaltyReturnTypeOnItsOwnLine: 200
PointerAlignment: Left
PPIndentWidth:   -1
QualifierAlignment: Leave
RawStringFormats:
  - Language:        Cpp
    Delimiters:
      - cc
      - CC
      - cpp
      - Cpp
      - CPP
      - 'c++'
      - 'C++'
    CanonicalDelimiter: ''
    BasedOnStyle:    google
  - Language:        TextProto
    Delimiters:
      - pb
      - PB
      - proto
      - PROTO
    EnclosingFunctions:
      - EqualsProto
      - EquivToProto
      - PARSE_PARTIAL_TEXT_PROTO
      - PARSE_TEST_PROTO
      - PARSE_TEXT_PROTO
      - ParseTextOrDie
      - ParseTextProtoOrDie
      - ParseTestProto
      - ParsePartialTestProto
    CanonicalDelimiter: pb
    BasedOnStyle:    google
ReferenceAlignment: Pointer
ReflowComments:  true
RemoveBracesLLVM: false
RemoveParentheses: Leave
RemoveSemicolon: false
RequiresClausePosition: OwnLine
RequiresExpressionIndentation: OuterScope
SeparateDefinitionBlocks: Leave
ShortNamespaceLines: 1
SkipMacroDefinitionBody: false
SortIncludes:    CaseSensitive
SortJavaStaticImport: Before
SortUsingDeclarations: LexicographicNumeric
SpaceAfterCStyleCast: false
SpaceAfterLogicalNot: false
SpaceAfterTemplateKeyword: true
SpaceAroundPointerQualifiers: Default
SpaceBeforeAssignmentOperators: true
SpaceBeforeCaseColon: false
SpaceBeforeCpp11BracedList: true
SpaceBeforeCtorInitializerColon: true
SpaceBeforeInheritanceColon: true
SpaceBeforeJsonColon: false
SpaceBeforeParens: ControlStatements
SpaceBeforeParensOptions:
  AfterControlStatements: true
  AfterForeachMacros: true
  AfterFunctionDefinitionName: false
  AfterFunctionDeclarationName: false
  AfterIfMacros:   true
  AfterOverloadedOperator: false
  AfterPlacementOperator: true
  AfterRequiresInClause: false
  AfterRequiresInExpression: false
  BeforeNonEmptyParentheses: false
SpaceBeforeRangeBasedForLoopColon: true
SpaceBeforeSquareBrackets: false
SpaceInEmptyBlock: false
SpacesBeforeTrailingComments: 2
SpacesInAngles:  Never
SpacesInContainerLiterals: true
SpacesInLineCommentPrefix:
  Minimum:         1
  Maximum:         -1
SpacesInParens:  Never
SpacesInParensOptions:
  ExceptDoubleParentheses: false
  InCStyleCasts:   false
  InConditionalStatements: false
  InEmptyParentheses: false
  Other:           false
SpacesInSquareBrackets: false
Standard:        Auto
StatementAttributeLikeMacros:
  - Q_EMIT
StatementMacros:
  - Q_UNUSED
  - QT_REQUIRE_VERSION
TableGenBreakInsideDAGArg: DontBreak
TabWidth:        8
UseTab:          Never
VerilogBreakBetweenInstancePorts: true
WhitespaceSensitiveMacros:
  - BOOST_PP_STRINGIZE
  - CF_SWIFT_NAME
  - NS_SWIFT_NAME
  - PP_STRINGIZE
  - STRINGIZE
...
")

(setq gitignore-content
      "/bin/
/build/
/.cache/
")

(setq gnu-gpl-license-cpp-header-content
      "/*
 *  Copyright (c) @YEAR@ @AUTOR@
 *
 *  This file is part of @PROJECT-NAME@.
 *
 *  @PROJECT-NAME@ is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  @PROJECT-NAME@ is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with @PROJECT-NAME@.  If not, see <https://www.gnu.org/licenses/>.
 *
 *     Author: @AUTOR@
 */

")

(setq main-cpp-content
      "int main(int argc, char **argv) {
        return 0;
}
")

(setq config-h-content
      "#ifndef _CONFIG_H_
#define _CONFIG_H_

#include <QStringList>

#define APPLICATION_NAME @APPLICATION_NAME@
#define APPLICATION_VERSION @APPLICATION_VERSION@
#define APPLICATION_DESCRIPTION \"@PROJECT-NAME@\"

#define BUILT_TIMESTAMP @TODAY_TEXT@
#define BUILT_COMPILER_VERSION @CMAKE_CXX_COMPILER_VERSION_TEXT@
#define BUILT_COMPILER_ID @CMAKE_CXX_COMPILER_ID_TEXT@
#define COPYRIGHT_YEAR @COPY_YEAR_TEXT@

#endif
")

(setq cmake-lists-content
      "cmake_minimum_required(VERSION @CMAKE-MIN-REQ@)

set(PROGRAM_NAME @PROJECT-NAME@)
project(${PROGRAM_NAME})
set(SOURCES_SUBDIR @SOURCE-SUB-DIR@)

set(INCLUDES ${PROJECT_SOURCE_DIR}/${SOURCES_SUBDIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

set(CMAKE_CXX_STANDARD @CMAKE-CXX-STANDART@)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(${INCLUDES})

add_executable(${PROGRAM_NAME}
  ${SOURCES_SUBDIR}/main.cpp
)
")

(provide 'create-cpp-project)
