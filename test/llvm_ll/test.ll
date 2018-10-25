; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%struct.Person = type { i32, [10 x i8] }

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"new_name\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
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
  %3 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  call void @llvm.dbg.declare(metadata i32** %2, metadata !25, metadata !14), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %3, metadata !27, metadata !14), !dbg !28
  %4 = load i32*, i32** %2, align 8, !dbg !29
  store i32* %4, i32** %3, align 8, !dbg !28
  %5 = load i32*, i32** %3, align 8, !dbg !30
  %6 = load i32, i32* %5, align 4, !dbg !31
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32 %6), !dbg !32
  %8 = load i32*, i32** %2, align 8, !dbg !33
  store i32 20, i32* %8, align 4, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @func3(i32) #0 !dbg !36 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !39, metadata !14), !dbg !40
  %3 = load i32, i32* %2, align 4, !dbg !41
  %4 = add nsw i32 %3, 1, !dbg !42
  store i32 %4, i32* %2, align 4, !dbg !43
  %5 = load i32, i32* %2, align 4, !dbg !44
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %5), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @func4(%struct.Person*) #0 !dbg !47 {
  %2 = alloca %struct.Person*, align 8
  %3 = alloca i8*, align 8
  store %struct.Person* %0, %struct.Person** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.Person** %2, metadata !59, metadata !14), !dbg !60
  call void @llvm.dbg.declare(metadata i8** %3, metadata !61, metadata !14), !dbg !62
  %4 = load %struct.Person*, %struct.Person** %2, align 8, !dbg !63
  %5 = getelementptr inbounds %struct.Person, %struct.Person* %4, i32 0, i32 1, !dbg !64
  %6 = getelementptr inbounds [10 x i8], [10 x i8]* %5, i32 0, i32 0, !dbg !63
  store i8* %6, i8** %3, align 8, !dbg !62
  %7 = load i8*, i8** %3, align 8, !dbg !65
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* %7), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @func5(i32*, i32*) #0 !dbg !68 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8
  call void @llvm.dbg.declare(metadata i32** %3, metadata !71, metadata !14), !dbg !72
  store i32* %1, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !73, metadata !14), !dbg !74
  %5 = load i32*, i32** %3, align 8, !dbg !75
  %6 = load i32, i32* %5, align 4, !dbg !76
  %7 = add nsw i32 %6, 1, !dbg !76
  store i32 %7, i32* %5, align 4, !dbg !76
  %8 = load i32*, i32** %3, align 8, !dbg !77
  call void @func2(i32* %8), !dbg !78
  ret i32 1, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @callFuncP(i32 (i32*, i32*)*) #0 !dbg !80 {
  %2 = alloca i32 (i32*, i32*)*, align 8
  %3 = alloca i32, align 4
  store i32 (i32*, i32*)* %0, i32 (i32*, i32*)** %2, align 8
  call void @llvm.dbg.declare(metadata i32 (i32*, i32*)** %2, metadata !84, metadata !14), !dbg !85
  call void @llvm.dbg.declare(metadata i32* %3, metadata !86, metadata !14), !dbg !87
  store i32 5, i32* %3, align 4, !dbg !87
  %4 = load i32 (i32*, i32*)*, i32 (i32*, i32*)** %2, align 8, !dbg !88
  %5 = call i32 %4(i32* %3, i32* %3), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !90 {
  %1 = alloca %struct.Person, align 4
  call void @llvm.dbg.declare(metadata %struct.Person* %1, metadata !93, metadata !14), !dbg !94
  %2 = bitcast %struct.Person* %1 to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.Person* @main.p to i8*), i64 16, i32 4, i1 false), !dbg !94
  %3 = getelementptr inbounds %struct.Person, %struct.Person* %1, i32 0, i32 0, !dbg !95
  call void @func2(i32* %3), !dbg !96
  %4 = getelementptr inbounds %struct.Person, %struct.Person* %1, i32 0, i32 1, !dbg !97
  %5 = getelementptr inbounds [10 x i8], [10 x i8]* %4, i32 0, i32 0, !dbg !98
  call void @func1(i8* %5), !dbg !99
  %6 = getelementptr inbounds %struct.Person, %struct.Person* %1, i32 0, i32 0, !dbg !100
  %7 = load i32, i32* %6, align 4, !dbg !100
  call void @func3(i32 %7), !dbg !101
  call void @func4(%struct.Person* %1), !dbg !102
  call void @callFuncP(i32 (i32*, i32*)* @func5), !dbg !103
  ret i32 0, !dbg !104
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
!27 = !DILocalVariable(name: "tmp_age", scope: !20, file: !1, line: 15, type: !23)
!28 = !DILocation(line: 15, column: 10, scope: !20)
!29 = !DILocation(line: 15, column: 20, scope: !20)
!30 = !DILocation(line: 16, column: 19, scope: !20)
!31 = !DILocation(line: 16, column: 18, scope: !20)
!32 = !DILocation(line: 16, column: 5, scope: !20)
!33 = !DILocation(line: 17, column: 6, scope: !20)
!34 = !DILocation(line: 17, column: 10, scope: !20)
!35 = !DILocation(line: 18, column: 1, scope: !20)
!36 = distinct !DISubprogram(name: "func3", scope: !1, file: !1, line: 20, type: !37, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !24}
!39 = !DILocalVariable(name: "age", arg: 1, scope: !36, file: !1, line: 20, type: !24)
!40 = !DILocation(line: 20, column: 16, scope: !36)
!41 = !DILocation(line: 21, column: 11, scope: !36)
!42 = !DILocation(line: 21, column: 15, scope: !36)
!43 = !DILocation(line: 21, column: 9, scope: !36)
!44 = !DILocation(line: 22, column: 20, scope: !36)
!45 = !DILocation(line: 22, column: 5, scope: !36)
!46 = !DILocation(line: 23, column: 1, scope: !36)
!47 = distinct !DISubprogram(name: "func4", scope: !1, file: !1, line: 25, type: !48, isLocal: false, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "Person", file: !1, line: 7, baseType: !52)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 4, size: 128, elements: !53)
!53 = !{!54, !55}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "age", scope: !52, file: !1, line: 5, baseType: !24, size: 32)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !52, file: !1, line: 6, baseType: !56, size: 80, offset: 32)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 80, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 10)
!59 = !DILocalVariable(name: "p", arg: 1, scope: !47, file: !1, line: 25, type: !50)
!60 = !DILocation(line: 25, column: 20, scope: !47)
!61 = !DILocalVariable(name: "name", scope: !47, file: !1, line: 26, type: !11)
!62 = !DILocation(line: 26, column: 11, scope: !47)
!63 = !DILocation(line: 26, column: 18, scope: !47)
!64 = !DILocation(line: 26, column: 21, scope: !47)
!65 = !DILocation(line: 27, column: 20, scope: !47)
!66 = !DILocation(line: 27, column: 5, scope: !47)
!67 = !DILocation(line: 28, column: 1, scope: !47)
!68 = distinct !DISubprogram(name: "func5", scope: !1, file: !1, line: 30, type: !69, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!24, !23, !23}
!71 = !DILocalVariable(name: "age", arg: 1, scope: !68, file: !1, line: 30, type: !23)
!72 = !DILocation(line: 30, column: 16, scope: !68)
!73 = !DILocalVariable(name: "age2", arg: 2, scope: !68, file: !1, line: 30, type: !23)
!74 = !DILocation(line: 30, column: 26, scope: !68)
!75 = !DILocation(line: 31, column: 6, scope: !68)
!76 = !DILocation(line: 31, column: 10, scope: !68)
!77 = !DILocation(line: 32, column: 11, scope: !68)
!78 = !DILocation(line: 32, column: 5, scope: !68)
!79 = !DILocation(line: 33, column: 5, scope: !68)
!80 = distinct !DISubprogram(name: "callFuncP", scope: !1, file: !1, line: 36, type: !81, isLocal: false, isDefinition: true, scopeLine: 36, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!84 = !DILocalVariable(name: "operation", arg: 1, scope: !80, file: !1, line: 36, type: !83)
!85 = !DILocation(line: 36, column: 20, scope: !80)
!86 = !DILocalVariable(name: "a", scope: !80, file: !1, line: 37, type: !24)
!87 = !DILocation(line: 37, column: 9, scope: !80)
!88 = !DILocation(line: 38, column: 5, scope: !80)
!89 = !DILocation(line: 39, column: 1, scope: !80)
!90 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 41, type: !91, isLocal: false, isDefinition: true, scopeLine: 41, isOptimized: false, unit: !0, variables: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!24}
!93 = !DILocalVariable(name: "p", scope: !90, file: !1, line: 42, type: !51)
!94 = !DILocation(line: 42, column: 12, scope: !90)
!95 = !DILocation(line: 43, column: 14, scope: !90)
!96 = !DILocation(line: 43, column: 5, scope: !90)
!97 = !DILocation(line: 44, column: 13, scope: !90)
!98 = !DILocation(line: 44, column: 11, scope: !90)
!99 = !DILocation(line: 44, column: 5, scope: !90)
!100 = !DILocation(line: 45, column: 13, scope: !90)
!101 = !DILocation(line: 45, column: 5, scope: !90)
!102 = !DILocation(line: 46, column: 5, scope: !90)
!103 = !DILocation(line: 47, column: 5, scope: !90)
!104 = !DILocation(line: 48, column: 1, scope: !90)
