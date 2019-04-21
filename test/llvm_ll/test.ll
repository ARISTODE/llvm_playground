; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.Person = type { i32, [10 x i8] }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"new_name\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@main.p = private unnamed_addr constant %struct.Person { i32 15, [10 x i8] c"Jack\00\00\00\00\00\00" }, align 4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @func1(i8*) #0 !dbg !8 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !13, metadata !14), !dbg !15
  %3 = load i8*, i8** %2, align 8, !dbg !16
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %3), !dbg !17
  %5 = load i8*, i8** %2, align 8, !dbg !18
  %6 = load i8*, i8** %2, align 8, !dbg !18
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true), !dbg !18
  %8 = call i8* @__strncpy_chk(i8* %5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i64 10, i64 %7) #5, !dbg !18
  ret void, !dbg !19
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8*, i8*, i64, i64) #3

; Function Attrs: nounwind readnone speculatable
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1, i1) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @func2(i32*) #0 !dbg !20 {
  %2 = alloca i32*, align 8
  %3 = alloca i32**, align 8
  %4 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  call void @llvm.dbg.declare(metadata i32** %2, metadata !25, metadata !14), !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %3, metadata !27, metadata !14), !dbg !29
  store i32** %2, i32*** %3, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i32** %4, metadata !30, metadata !14), !dbg !31
  %5 = load i32**, i32*** %3, align 8, !dbg !32
  %6 = load i32*, i32** %5, align 8, !dbg !33
  store i32* %6, i32** %4, align 8, !dbg !31
  ret void, !dbg !34
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @func3(i32) #0 !dbg !35 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !38, metadata !14), !dbg !39
  %3 = load i32, i32* %2, align 4, !dbg !40
  %4 = add nsw i32 %3, 1, !dbg !41
  store i32 %4, i32* %2, align 4, !dbg !42
  %5 = load i32, i32* %2, align 4, !dbg !43
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i32 %5), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @func4(%struct.Person*) #0 !dbg !46 {
  %2 = alloca %struct.Person*, align 8
  %3 = alloca i8*, align 8
  store %struct.Person* %0, %struct.Person** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.Person** %2, metadata !58, metadata !14), !dbg !59
  call void @llvm.dbg.declare(metadata i8** %3, metadata !60, metadata !14), !dbg !61
  %4 = load %struct.Person*, %struct.Person** %2, align 8, !dbg !62
  %5 = getelementptr inbounds %struct.Person, %struct.Person* %4, i32 0, i32 1, !dbg !63
  %6 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i32 0, i32 0, !dbg !62
  store i8* %6, i8** %3, align 8, !dbg !61
  %7 = load i8*, i8** %3, align 8, !dbg !64
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* %7), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @func5(i32*, i32*) #0 !dbg !67 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !70, metadata !14), !dbg !71
  store i32* %1, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !72, metadata !14), !dbg !73
  %5 = load i32*, i32** %3, align 8, !dbg !74
  %6 = load i32, i32* %5, align 4, !dbg !75
  %7 = add nsw i32 %6, 1, !dbg !75
  store i32 %7, i32* %5, align 4, !dbg !75
  %8 = load i32*, i32** %3, align 8, !dbg !76
  call void @func2(i32* %8), !dbg !77
  ret i32 1, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @callFuncP(i32 (i32*, i32*)*) #0 !dbg !79 {
  %2 = alloca i32 (i32*, i32*)*, align 8
  %3 = alloca i32, align 4
  store i32 (i32*, i32*)* %0, i32 (i32*, i32*)** %2, align 8
  call void @llvm.dbg.declare(metadata i32 (i32*, i32*)** %2, metadata !83, metadata !14), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %3, metadata !85, metadata !14), !dbg !86
  store i32 5, i32* %3, align 4, !dbg !86
  %4 = load i32 (i32*, i32*)*, i32 (i32*, i32*)** %2, align 8, !dbg !87
  %5 = call i32 %4(i32* %3, i32* %3), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !89 {
  %1 = alloca %struct.Person, align 4
  call void @llvm.dbg.declare(metadata %struct.Person* %1, metadata !92, metadata !14), !dbg !93
  %2 = bitcast %struct.Person* %1 to i8*, !dbg !93
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.Person* @main.p to i8*), i64 16, i32 4, i1 false), !dbg !93
  %3 = getelementptr inbounds %struct.Person, %struct.Person* %1, i32 0, i32 0, !dbg !94
  call void @func2(i32* %3), !dbg !95
  %4 = getelementptr inbounds %struct.Person, %struct.Person* %1, i32 0, i32 1, !dbg !96
  %5 = getelementptr inbounds [10 x i8], [10 x i8]* %4, i32 0, i32 0, !dbg !97
  call void @func1(i8* %5), !dbg !98
  %6 = getelementptr inbounds %struct.Person, %struct.Person* %1, i32 0, i32 0, !dbg !99
  %7 = load i32, i32* %6, align 4, !dbg !99
  call void @func3(i32 %7), !dbg !100
  call void @func4(%struct.Person* %1), !dbg !101
  call void @callFuncP(i32 (i32*, i32*)* @func5), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.2 (tags/RELEASE_502/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "test.c", directory: "/Users/yongzhehuang/Documents/pdg-projects/llvm_playground/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 5.0.2 (tags/RELEASE_502/final)"}
!8 = distinct !DISubprogram(name: "func1", scope: !1, file: !1, line: 9, type: !9, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{null, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "name", arg: 1, scope: !8, file: !1, line: 9, type: !11)
!14 = !DIExpression()
!15 = !DILocation(line: 9, column: 18, scope: !8)
!16 = !DILocation(line: 10, column: 18, scope: !8)
!17 = !DILocation(line: 10, column: 5, scope: !8)
!18 = !DILocation(line: 11, column: 5, scope: !8)
!19 = !DILocation(line: 12, column: 1, scope: !8)
!20 = distinct !DISubprogram(name: "func2", scope: !1, file: !1, line: 14, type: !21, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DILocalVariable(name: "age", arg: 1, scope: !20, file: !1, line: 14, type: !23)
!26 = !DILocation(line: 14, column: 17, scope: !20)
!27 = !DILocalVariable(name: "tt", scope: !20, file: !1, line: 16, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!29 = !DILocation(line: 16, column: 11, scope: !20)
!30 = !DILocalVariable(name: "age1", scope: !20, file: !1, line: 17, type: !23)
!31 = !DILocation(line: 17, column: 10, scope: !20)
!32 = !DILocation(line: 17, column: 18, scope: !20)
!33 = !DILocation(line: 17, column: 17, scope: !20)
!34 = !DILocation(line: 20, column: 1, scope: !20)
!35 = distinct !DISubprogram(name: "func3", scope: !1, file: !1, line: 22, type: !36, isLocal: false, isDefinition: true, scopeLine: 22, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{null, !24}
!38 = !DILocalVariable(name: "age", arg: 1, scope: !35, file: !1, line: 22, type: !24)
!39 = !DILocation(line: 22, column: 16, scope: !35)
!40 = !DILocation(line: 23, column: 11, scope: !35)
!41 = !DILocation(line: 23, column: 15, scope: !35)
!42 = !DILocation(line: 23, column: 9, scope: !35)
!43 = !DILocation(line: 24, column: 20, scope: !35)
!44 = !DILocation(line: 24, column: 5, scope: !35)
!45 = !DILocation(line: 25, column: 1, scope: !35)
!46 = distinct !DISubprogram(name: "func4", scope: !1, file: !1, line: 27, type: !47, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "Person", file: !1, line: 7, baseType: !51)
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 4, size: 128, elements: !52)
!52 = !{!53, !54}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "age", scope: !51, file: !1, line: 5, baseType: !24, size: 32)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !51, file: !1, line: 6, baseType: !55, size: 80, offset: 32)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 80, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 10)
!58 = !DILocalVariable(name: "p", arg: 1, scope: !46, file: !1, line: 27, type: !49)
!59 = !DILocation(line: 27, column: 20, scope: !46)
!60 = !DILocalVariable(name: "name", scope: !46, file: !1, line: 28, type: !11)
!61 = !DILocation(line: 28, column: 11, scope: !46)
!62 = !DILocation(line: 28, column: 18, scope: !46)
!63 = !DILocation(line: 28, column: 21, scope: !46)
!64 = !DILocation(line: 29, column: 20, scope: !46)
!65 = !DILocation(line: 29, column: 5, scope: !46)
!66 = !DILocation(line: 30, column: 1, scope: !46)
!67 = distinct !DISubprogram(name: "func5", scope: !1, file: !1, line: 32, type: !68, isLocal: false, isDefinition: true, scopeLine: 32, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!24, !23, !23}
!70 = !DILocalVariable(name: "age", arg: 1, scope: !67, file: !1, line: 32, type: !23)
!71 = !DILocation(line: 32, column: 16, scope: !67)
!72 = !DILocalVariable(name: "age2", arg: 2, scope: !67, file: !1, line: 32, type: !23)
!73 = !DILocation(line: 32, column: 26, scope: !67)
!74 = !DILocation(line: 33, column: 6, scope: !67)
!75 = !DILocation(line: 33, column: 10, scope: !67)
!76 = !DILocation(line: 34, column: 11, scope: !67)
!77 = !DILocation(line: 34, column: 5, scope: !67)
!78 = !DILocation(line: 35, column: 5, scope: !67)
!79 = distinct !DISubprogram(name: "callFuncP", scope: !1, file: !1, line: 38, type: !80, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{null, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!83 = !DILocalVariable(name: "operation", arg: 1, scope: !79, file: !1, line: 38, type: !82)
!84 = !DILocation(line: 38, column: 20, scope: !79)
!85 = !DILocalVariable(name: "a", scope: !79, file: !1, line: 39, type: !24)
!86 = !DILocation(line: 39, column: 9, scope: !79)
!87 = !DILocation(line: 40, column: 5, scope: !79)
!88 = !DILocation(line: 41, column: 1, scope: !79)
!89 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 43, type: !90, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, unit: !0, variables: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!24}
!92 = !DILocalVariable(name: "p", scope: !89, file: !1, line: 44, type: !50)
!93 = !DILocation(line: 44, column: 12, scope: !89)
!94 = !DILocation(line: 45, column: 14, scope: !89)
!95 = !DILocation(line: 45, column: 5, scope: !89)
!96 = !DILocation(line: 46, column: 13, scope: !89)
!97 = !DILocation(line: 46, column: 11, scope: !89)
!98 = !DILocation(line: 46, column: 5, scope: !89)
!99 = !DILocation(line: 47, column: 13, scope: !89)
!100 = !DILocation(line: 47, column: 5, scope: !89)
!101 = !DILocation(line: 48, column: 5, scope: !89)
!102 = !DILocation(line: 49, column: 5, scope: !89)
!103 = !DILocation(line: 50, column: 1, scope: !89)
